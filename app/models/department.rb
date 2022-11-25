class Department < ApplicationRecord

  def self.import(file)
    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
      Department.create(row.to_hash)
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Title"]
      all.each do |department|
        csv << [department.title]
      end
    end
  end
end
