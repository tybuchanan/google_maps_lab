class PinsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pins = Pin.all
    gon.push({:email_id => current_user.email})
    respond_to do |f|
      f.html {render :index}
      f.json { render :json => @pins, :only => [:lat, :long, :email_id]}
    end
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new pin_params
    if @pin.save  
      respond_to do |f|
        f.html
        format.json { render json: @pin, status: :created}
      end
    else
        format.json { render json: @pin.errors, status: :unprocessable_entity}
    end
  end

private
  def pin_params
    params.require(:pin).permit(:lat, :long, :email_id)
  end
end



