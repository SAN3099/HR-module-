require 'rails_helper'

RSpec.describe EmployeesController , type: :controller do
    let(:user) { create(:user) } # Assuming you have FactoryBot set up for user creation

  before do
    sign_in user # Sign in the user before each test
  end
    
    describe "POST #create" do
        context "with valid parameters" do 
            it "created a new employee" do 
                expect {
                    post :create, params: { employee: { first_name: "John", last_name: "Doe", email: "JD@bot.com", city: "New York" , state: "New York", country: "US", pincode: "10001", address_line_1: "New Yorker Hotel"}}
                }.to change(Employee, :count).by(1)
            end
            it "redirects to the employee index page" do
                post :create, params: { employee: { first_name: "John", last_name: "Doe", email: "JD@bot.com", city: "New York" , state: "New York", country: "US", pincode: "10001", address_line_1: "New Yorker Hotel"}}
                expect(response).to redirect_to(employees_path)
            end
        end
        context "with invalid parameters" do
            it "does not create a new employee" do
                expect {
                    post :create, params: { employee: { first_name: "", last_name: "", email: "", city: "" , state: "", country: "", pincode: "", address_line_1: ""}}
                }.not_to change(Employee, :count)
            end
            it "re-renders the 'new' template" do
                post :create, params: { employee: { first_name: "", last_name: "", email: "", city: "" , state: "", country: "", pincode: "", address_line_1: ""}}
                expect(response).to render_template("new")
            end
        end
    end
end

RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, type: :controller
  end
  
