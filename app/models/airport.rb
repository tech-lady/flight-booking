class Airport < ApplicationRecord
  has_many :flights

  validates :name, presence: true
  validates :state_id, presence: true
end
