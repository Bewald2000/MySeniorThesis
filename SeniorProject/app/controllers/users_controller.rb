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
      @user = User.create(params[:user])
      if @user.save
        redirect_to @user
      else
        render :new, status: :unprocessible_entity
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
  
      if @user.update(user_params)
        redirect_to @user
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
        params.require(:user).permit(:username, :password, :fname, :lname, :prename, :phonenumber, :email, :status)
      end
  end