class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :editPass, :updatePass]

  def index  
    @users = User.all
  end
  def show
  end
  def new    
    @user = User.new
  end
  def edit
  end
  def create 
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario creado satisfactoriamente!.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def update 
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuario actualizado satisfactoriamente!.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def editPass
  end
  def updatePass
    respond_to do |format|
      if User.valid_password?(params[:user][:authme],@user)
        if User.equalPass?(params[:user][:password],params[:user][:password_confirmation],@user)
          @user.password = params[:user][:password]
          if @user.save
            format.html { redirect_to @user, notice: 'Usuario actualizado satisfactoriamente!.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :editPass }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :editPass }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :editPass }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario eliminado satisfactoriamente!.' }
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
      params.require(:user).permit(:name, :fullname, :email, :password, :password_confirmation, :authme)
    end
end
