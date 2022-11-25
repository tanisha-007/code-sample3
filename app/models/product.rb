class Product < ApplicationRecord
  require 'csv'

  belongs_to :category

 def self.import(file)
   CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
     Product.create(row.to_hash)
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Title", "Description", "Skucode", "Price", "Category" ]
      all.each do |product|
        csv << [product.title, product.description, product.skucode, product.price, product.category.title]
      end
    end
  end
end
