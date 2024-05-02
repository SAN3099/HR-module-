class Employee < ApplicationRecord
    has_many :documents
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :city, :state, :pincode, :country, :address_line_1, presence: true
    validates :date_of_joining, :date_of_birth, :job_title, presence: true

    def name
        "#{first_name} #{last_name}".strip 
    end

    def full_address
        "#{address_line_1} #{city}, #{state}, #{pincode},#{country} "
    end

    def name_with_email
        "#{name} (#{email})"
    end
end
