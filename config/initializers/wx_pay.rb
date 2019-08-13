WxPay.appid = ENV['WECHAT_APP_ID']
WxPay.key = ENV['WECHAT_PAY_API_KEY']
WxPay.mch_id = ENV['WECHAT_PAY_MCH_ID']
WxPay.debug_mode = true # default is `true`

# optional - configurations for RestClient timeout, etc.
WxPay.extra_rest_client_options = { timeout: 6, open_timeout: 8 }
