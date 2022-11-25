class Category < ApplicationRecord
  require 'csv'
  
  has_ancestry
  validates_presence_of :title, :description
  has_many :products

  def self.import(file)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      Category.create(row.to_hash)
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Title", "Description"]
      all.each do |category|
        csv << [category.title, category.description]
      end
    end
  end
end
