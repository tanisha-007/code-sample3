require 'csv'

class Customer < ApplicationRecord

  validates_presence_of :full_name

  has_many :orders

  def full_address
    "#{address_line_1} #{city} #{state} #{country} #{zipcode}"
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      Customer.where(email: row[3]).find_or_create_by(row.to_hash)
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Full Name", "Email", "Mobile", "Full Address", "PAN Number"]
      all.each do |customer|
        csv << [customer.full_name, customer.email, customer.mobile, customer.full_address, customer.pan_number]
      end
    end
  end
end

