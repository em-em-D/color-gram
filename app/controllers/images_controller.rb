# frozen_string_literal: true

# :nodoc:
class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to image_path(@image.id), notice: 'Image uploaded successfully'
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
