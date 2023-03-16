class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
end
