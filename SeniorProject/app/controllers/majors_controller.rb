class MajorsController < ApplicationController
    def create
        @degree = Degree.find(params[:degree_id])
        @major = @degree.major.create(major_params)
        redirect_to degree_path(@degree)
    end

    def destroy
      @degree = Degree.find(params[:degree_id])
      @major = @degree.major.find(params[:id])
      @major.destroy
      redirect_to degree_path(@degree), status: :see_other
    end
    
    private
        def major_params
          params.require(:major).permit(:majname, :status)
        end
end
