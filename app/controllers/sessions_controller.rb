class SessionsController < ApplicationController
  
  def new
    session[:return_to] ||= request.referer
  end
  
  def create
    
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id # store :user_in browser session
      flash[:success] = "You have successfully been logged in" #tell user they are logged in
      redirect_to session.delete(:return_to) # take user to their page
    else
      flash.now[:danger] = "The email or password you entered did not match our records. Please try again." # oops, error!
      render 'new' # re-render login page
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully been logged out"
    redirect_to root_path
  end
  
end
