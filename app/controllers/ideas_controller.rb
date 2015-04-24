class IdeasController < ApplicationController

  def index
    @ideas = current_user.ideas.all
  end

  def new
    @idea = Idea.new
  end

  def show
    @idea = current_user.ideas.find(params[:id])
  end

  def create
    category = Category.find(idea_params[:category_id])
    @idea = current_user.ideas.new(idea_params.merge(category_id: category.id))
    if @idea.save
      flash[:notice] = "Idea was successfully created"
      redirect_to user_path(@idea)
    else
      flash[:error] = "Could not be created"
      render :new
    end
  end

  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  def update
    @idea = current_user.ideas.find(params[:id])
    if @idea.update(idea_params)
      redirect_to user_path(@idea)
      flash[:notice] = "Successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy
    redirect_to user_path(@idea)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id)
  end
end