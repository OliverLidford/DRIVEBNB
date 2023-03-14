class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :status, inclusion: { in: %w[pending accepted declined] }, presence: true

  before_validation :set_default_status

  private

  def set_default_status
    self.status ||= "pending"
  end
end
