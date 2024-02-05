class ArticlesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = Users.find(params[:id])
  end
  
  def new
    @users = Users.new
  end

  def create
    @users = Users.new(user_params)
    if @users.save
      redirect_to @users
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

  private
    def user_params
      params.require(:user).permit(:fname, :lname, :prename, :phonenumber, :email)
    end
end