class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
    flash[:notice] = "Successfully logged out"
  end

  private

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end