class Feedback < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :booking
end
