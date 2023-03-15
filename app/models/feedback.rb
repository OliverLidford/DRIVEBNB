class Feedback < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :booking

  validates :booking_id, uniqueness: { scope: :user_id }
end
