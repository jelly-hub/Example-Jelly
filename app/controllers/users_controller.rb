class UsersController < ApplicationController
  include ApplicationHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # With this the link to the login page works. Without, an CSRF Error occured.
  # It has to be reworked tho, as it may produce a security risk and there is probably a better solution.
  skip_before_filter :verify_authenticity_token, except: [:login]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @foods = Food.all
    @locations = Location.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  #IMPORTANT SIDENOTE:
  # => create users with >> password_digest: BCrypt::Password.create("...")  <<
  # => ganz wichtig ... ansonsten suchst du den Fehler wieder ewig Ò.ó
  def create
    # create User with user input from the sign up page
    @user = User.new(user_params)

    # Users which sign up via the Sign Up form have the role "User" by default.
    # => Other Admins have to be created by the Masteradmin
    @user.role = "User"

    # if Saving is successful log the user in and redirect to the user page
    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'Email already exists.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:e_mail, :password, :name)
    end
end
