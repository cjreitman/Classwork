class CatsController < ApplicationController
  
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    # @cat = Cat.new
    render :new  
  end

  def create
    @cat = Cat.new(cats_params)
    
    if @cat.save
      # render json: cat
      redirect_to cats_url(@cat.id)
    else
      render :new, status: 422
    end
  end

  private

  def cats_params
    params.require(:cat).permit(:name, :color, :sex, :description, :birth_date)
  end

end
