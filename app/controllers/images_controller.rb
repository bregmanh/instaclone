class ImagesController < ApplicationController
  def index
    if current_user
      @images = Image.where(user_id: current_user.id).order(created_at: :desc).limit(30)

  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to @image, notice: 'Image uploaded!'
    else
      render :new
    end
  end

  def destroy
    puts "here"
    @image = Image.find params[:id]
    @image.destroy
    redirect_to [:images], notice: 'Product deleted!' and return
  end

  private

  def image_params
    params.require(:image).permit(:image, :description)
  end
end

