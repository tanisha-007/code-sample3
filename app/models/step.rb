class Step < ApplicationRecord
  require 'csv'
  
  validates_presence_of :title

  def self.import(file)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      Step.create(row.to_hash)
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Title", "Description"]
      all.each do |step|
        csv << [step.title, step.description]
      end
    end
  end
end
