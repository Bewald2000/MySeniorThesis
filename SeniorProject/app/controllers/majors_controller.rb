class MajorsController < ApplicationController
    def create
        @degree = Degree.find(params[:degree_id])
        @major = @degree.major.create(major_params)
        redirect_to degree_path(@degree)
    end
    
    private
        def major_params
          params.require(:major).permit(:majname, :status)
        end
end
