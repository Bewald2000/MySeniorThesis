class WorkController < ApplicationController
    def create
        @user = Users.find(params[:user_id])
        @work = @users.work.create(work_params)
        redirect_to users_path(@users)
    end

    def destroy
        @auser = User.find(params[:user_id])
        @work = @user.work.find(params[:id])
        @work.destroy
        redirect_to users_path(@users), status: :see_other
    end

    private
        def work_params
            params.require(:work).permit(:position,:description, :sdate, :edate, :reference, :refphone, :refemail, :companyname, :status)
        end
end
