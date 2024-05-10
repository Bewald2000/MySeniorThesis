class UserSessionsController < ApplicationController
  UserSession.create(:login => users_id.login, :password => users_id.password, :remember_me => true)

  session = UserSession.new(:login => users_id.login, :password => users_id.password, :remember_me => true)
  session.save
  
  # requires the authlogic-oid "add on" gem
  UserSession.create(:openid_identifier => "identifier", :remember_me => true)
  
  # skip authentication and log the user in directly, the true means "remember me"
  UserSession.create(my_user_object, true)
    def new
      @user_session = UserSession.new
    end
  
    def create
      @user_session = UserSession.new(user_session_params.to_h)
      if @user_session.save
        redirect_to user_path(@user)
      else
        render :new, status: 422
      end
    end
  
    def destroy
      current_user_session.destroy
      redirect_to new_user_session_url
    end
  
    private
  
    def user_session_params
      params.require(:user_session).permit(:login, :password, :remember_me)
    end
  end