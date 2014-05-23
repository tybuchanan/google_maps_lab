class PinsController < ApplicationController
  # before_action :authenticate_user!

  attr_accessor :lat, :long

  def index
    @pins = Pin.all
    @pin = Pin.new
    respond_to do |f|
        f.html 
        f.json { render :json => @pins, :only => [:lat, :long]}
    end
  end


  def create
     @pin = Pin.new pin_params
    if @pin.save  
      respond_to do |f|
        f.html
        f.json { render :json => @pins, :only => [:lat, :long]}
      end
    # else
    #   render :index
    end
  end

private
  def pin_params
    params.require(:pin).permit(:lat, :long)
  end
end



