class Admin::CategoriesController < Admin::BaseController

  def index 
    @categories = Category.all
  end

  def show
    @category = Category.find_by(params[:name])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "'#{@category.name}' was successfully created!"
      redirect_to admin_category_path(@category)
    else
      flash[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_category_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end 
end