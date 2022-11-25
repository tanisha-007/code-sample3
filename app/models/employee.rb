class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department
  belongs_to :role

  validates_presence_of :full_name

  def self.import(file)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      Employee.create(row.to_hash)
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Full Name", "Email", "Department", "Role" ]
      all.each do |employee|
        csv << [employee.full_name, employee.email, employee.department.title, employee.role.title ]
      end
    end
  end
end
