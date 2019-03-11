class AlbumsController < ApplicationController

  def new
    render :new
  end

  def create
    debugger
    @album = Album.new(album_params)
    #add logic here to turn the band_name into a band_id
    if @album.save
      render json: Album.all
    else
      render plain: "Nope, didn't work, bro."
    end
  end
  


  private

    def album_params
      params.require(:album).permit(:title, :year, :band_name, :studio_album?)
    end
end