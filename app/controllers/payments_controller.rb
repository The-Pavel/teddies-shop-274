class PaymentsController < ApplicationController
  # need to skip verifying authenticity token for the create action
  # because that action will be called by a POST request from Tencent
  skip_before_action :verify_authenticity_token, only: :create

  def show
    @order = Order.where(state: 'pending').find(params[:order_id])
    # creating payment params in format required by Tencent
    pay_params = {
      body: @order.teddy_sku,
      out_trade_no: "teddies_274_#{@order.id}", #batch number for uniqueness
      total_fee: @order.amount_cents,
      spbill_create_ip: Socket.ip_address_list.detect(&:ipv4_private?).ip_address,
      notify_url: ENV['WECHAT_PAY_NOTIFY_URL'],
      trade_type: 'NATIVE'
    }
    r = WxPay::Service.invoke_unifiedorder pay_params

    if r.success?
      @qr = RQRCode::QRCode.new(r['code_url'])
    else
      #for debugging in console
      p 'response unsuccessful'
      p r
    end
  end

  # a ping from Tencent on whether payment is successful or not
  def create
  result = Hash.from_xml(request.body.read)['xml']
  logger.info result.inspect
  if WxPay::Sign.verify?(result)
    order_id = result['out_trade_no'][12..-1].to_i
    Order.find(order_id).update(payment: result.to_json, state: 'paid')
    render xml: { return_code: 'SUCCESS', return_msg: 'OK' }.to_xml(root: 'xml', dasherize: false)
  else
    render xml: { return_code: 'FAIL', return_msg: 'Signature Error' }.to_xml(root: 'xml', dasherize: false)
  end
end
end
