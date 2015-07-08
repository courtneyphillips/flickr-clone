class PicturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    @picture = Picture.new(params[:picture])
    if @picture.save
      redirect_to @picture, notice: "Your picture was successfully uploaded."
    else
      render "new"
    end
  end
end
