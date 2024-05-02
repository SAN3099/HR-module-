class AddColumnToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :date_of_birth, :date
    add_column :employees, :job_title, :string
    add_column :employees, :date_of_joining, :date
    add_column :employees, :bio, :text
  
  end
end
