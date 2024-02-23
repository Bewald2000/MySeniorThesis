class DegreesController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @degree = @user.degree.create(degree_params)
        redirect_to user_path(@user)
    end

    private
        def degree_params
            params.require(:degree).permit(:schoolname, :sdate, :edate, :educaationlevel)
end
