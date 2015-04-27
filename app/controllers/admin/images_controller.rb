class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def index
    @images = Image.all
  end

  def show
    @image = Image.find_by(params[:title])
  end

  def create 
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image was successfully uploaded"
      redirect_to admin_image_path(@image)
    else
      flash[:error] = @image.errors.full_message.join(", ")
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to admin_image_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :attachment)
  end
end