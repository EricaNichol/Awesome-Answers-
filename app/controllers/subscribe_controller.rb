class SubscribeController < ApplicationController
  def index
  end

  def subscribe
    @name = params[:name]
    @last_name = params[:last_name]
    @email = params[:email]
  end

end
