class SessionsController < ApplicationController
  
  # GET session => '/login'
  # Load Login Page
  def new
  end

  # POST session => '/login'
  # Authenticate and create a session for, a User
  def create
  	@user = User.find_by(e_mail: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		# Login successful, save user_id to session and redirect to user page
  		log_in @user
  		redirect_to home_path
  	else
  		# Login unsuccessful, redirect to Log In Page and display an error message
  		flash.now[:danger] = 'Invalid email/password combination'
      render "new"
  	end
  end

  # DELETE session => '/logout'
  # Quit the Session of a User who has logged out
  def destroy
    log_out
    redirect_to root_path
  end
end
