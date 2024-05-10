class UsersController < ApplicationController
  def index
      @user = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
    
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to show_path(@users)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
  
      if @user.update(user_params)
        redirect_to users_path(@user)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
  
      redirect_to root_path, status: :see_other
    end
  
    private
      def user_params
        params.require(:user).permit(:login, :password, :password_confirmation, :fnames, :lname, :prename, :phonenumber, :email, :status)
      end
  end