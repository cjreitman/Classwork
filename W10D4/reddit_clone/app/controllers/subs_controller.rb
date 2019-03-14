class SubsController < ApplicationController

  before_action :require_signed_in, only: [:new, :create, :edit, :update]
  before_action :ensure_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
    
  end

  def edit
    @sub = current_user.subs.find(params[:id])
    render :edit
  end

  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.delete
    redirect_to subs_url
  end
  
  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def ensure_moderator
    @sub = Sub.find(params[:id])
    unless sub.moderator_id == current_user.id
      flash[:errors] = ['Only moderator can edit sub']
      redirect_to subs_url 
    end
  end
  
end
