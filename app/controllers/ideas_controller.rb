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
    @idea = current_user.ideas.new(idea_params)
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

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end