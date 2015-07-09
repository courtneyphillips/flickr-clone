class PicturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @user = current_user
    @picture = current_user.pictures.build
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @user = current_user
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to user_path(@user), notice: "Your picture was successfully uploaded."
    else
      render :new
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end

end
