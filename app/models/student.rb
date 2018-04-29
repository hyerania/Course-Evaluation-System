class Student < ApplicationRecord
    def self.to_csv
        attributes = %w{uin name section attempts score}
        CSV.generate(headers: true) do |csv|
          csv << attributes
          all.each do |student|
            csv << student.attributes.values_at(*attributes)
          end
        end
    end

end
