class WewebsController < ApplicationController
  # our controller for displaying the page in WeUI style, mobile first
  # has it's own views in the views/wewebs folder
  wechat_api
  layout 'wechat'

  def index
    @teddies = Teddy.all
  end

  def show
    @teddy = Teddy.find(params[:id])
  end
end
