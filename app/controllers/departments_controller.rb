class DepartmentsController < InheritedResources::Base
  
  def index
    @departments = Department.all
    respond_to do |format|
      format.html
      format.csv { send_data @departments.to_csv}
    end
  end

  def update
    update!(:notice => "Great! Department has updated successfully.") { departments_url }
  end

  def import
    Department.import(params[:import][:department_csv])
    redirect_to departments_path
  end

  def create
    create!(:notice => "Great! Department has created successfully.") { departments_url }
  end

  private

    def department_params
      params.require(:department).permit(:title)
    end

end
