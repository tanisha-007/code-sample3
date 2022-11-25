class EmployeesController < InheritedResources::Base
  
  def index
    @employees = Employee.all
    respond_to do |format|
      format.html
      format.csv { send_data @employees.to_csv}
    end
  end

  def update
    update!(:notice => "Great! Employee has updated successfully.") { employees_url }
  end

  def import
    Employee.import(params[:import][:employee_csv])
    redirect_to employees_path
  end

  def create
    create!(:notice => "Great! Employee has created successfully.") { employees_url }
  end

  private

    def employee_params
      params.require(:employee).permit(:full_name, :email, :department_id, :role_id, :password)
    end

end
