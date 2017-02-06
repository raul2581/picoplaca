class Vehicle < ApplicationRecord
  validates :plate_number, presence: true,
            length: { minimum: 7 }

  validates_format_of :matriculation_date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: dd/mm/yyyy"
end
