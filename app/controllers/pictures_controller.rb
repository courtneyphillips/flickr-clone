class PicturesController < ApplicationController
  load_and_authorize_resource :through => :users
  before_filter :authenticate_user!, except: [:index, :show]


  def index
    @pictures = Picture.all
  end

  def show
    @user = User.find(params[:user_id])
    # @picture = Picture.find(params[:id])
    @tag = Tag.find(params[:id])
  end

  def new
    @user = current_user
    @picture = current_user.pictures.build
  end

  def edit
    @user = User.find(params[:user_id])
    # @picture = Picture.find(params[:id])
  end

  def destroy
    # @picture = Picture.find(params[:id])
    @picture.destroy
      redirect_to user_path(current_user), notice: "Your picture is gone forever!"
  end

  def update
    @user = User.find(params[:user_id])
    # @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to user_path(current_user), notice: "Changes sucessfully made"
    else
      render :edit
    end
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
