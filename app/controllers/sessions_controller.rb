class SessionsController < ApplicationController
  #skip_before_action :authorize
  
  def new
  end

  def create
    
    user = User.find_by_email(params[:email])
       
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
    
#     user  = User.authenticate(params[:session][:email], params[:session][:email])
#     
#     if user.nil?
#       flash.now[:error] = "Invalid email/password combination!"
#       render :new
#     else
#       sign_in user
#       redirect_to user
#     end
    
    
    
#    user = User.find_by(email: params[:session][:email].downcase)
#     
#     if user and user.authenticate (params[:session][:password])
#       
#       session[:user_id] = user.id
#       redirect_to admin_url
#       
#     else
#       redirect_to login_url, alert: "Invalid user/password combination"
#     end
    
    
    
  end

  def destroy
    
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
    
#     sign_out
#     redirect_to sign_in_path
    
#     session[:user_id] = nil
#     redirect_to store_url, notice: "Logged out"
  end
end
