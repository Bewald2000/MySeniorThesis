class DegreesController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @degree = @user.degree.create(degree_params)
        redirect_to user_path(@user)
    end

    def destroy
        @auser = User.find(params[:user_id])
        @degree = @user.degree.find(params[:id])
        @degree.destroy
        redirect_to user_path(@user), status: :see_other
    end

    private
        def degree_params
            params.require(:degree).permit(:schoolname, :sdate, :edate, :educaationlevel, :status)
        end
end
