class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  # Add validation for status field
  validates :status, inclusion: { in: %w[pending accepted declined] }
end
