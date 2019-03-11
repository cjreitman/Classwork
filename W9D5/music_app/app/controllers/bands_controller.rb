class BandsController < ApplicationController


  def index
    render json: Band.all
  end

  def new
    @band = Band.new
    render :new
  end

  def create

    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      flash.now[:error] = "Didn't work, bro."
      render :new  
    end

  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end