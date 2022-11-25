require 'csv'

class CustomersController < InheritedResources::Base
    
  def index
    @customers = Customer.all
    respond_to do |format|
      format.html
      format.csv { send_data @customers.to_csv}
    end
  end

  def update
    update!(:notice => "Great! Customer has updated successfully.") { customers_url }
  end

  def import
    Customer.import(params[:import][:customer_csv])
    redirect_to customers_path
  end

  private

    def customer_params
      params.require(:customer).permit(:full_name, :email, :city, :country, :zipcode, :address_line_1, :pan_number, :state)
    end
end
