class EmployeesController < ApplicationController
    
    before_action :set_employee,only: %i[show edit update destroy]



    def index
        @employee = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)

        if @employee.save
            redirect_to employees_path, notice: 'New Employee details has been saved successfully'
        else
            flash.now[:alert] = 'Failure to save employee details'
            render :new
        end

    end

    def edit
        #@employee = Employee.find(params[:id])
        
    end

    def update
        #@employee = Employee.find(params[:id])
        if @employee.update(employee_params)
			redirect_to employees_path
		else
			render :edit
		end
        
    end

    def show
        #@employee = Employee.find(params[:id])
    end

    def destroy
        #@employee = Employee.find(params[:id])
        if @employee.destroy
            redirect_to employees_path, notice: "Employee is deleted successfully"
        end
        
    end




private
def employee_params
    params.require(:employee).permit(:first_name,:last_name,:email,
        :city,:state,:pincode,:address_line_1,:country)
end

def set_employee
    @employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFOund => error
        flash[:notice] = "Employee not found"
        redirect_to employees_path

end


end