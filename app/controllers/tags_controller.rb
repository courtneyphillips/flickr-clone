class TagsController < ApplicationController

  def new
    @picture = Picture.find(params[:picture_id])
    @tag = @picture.tags.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @user = @picture.user_id
    @tag = @picture.tags.create(tag_params)
    if @tag.save
      redirect_to user_picture_path(@user, @picture)
    end
  end

  def show
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end



end
