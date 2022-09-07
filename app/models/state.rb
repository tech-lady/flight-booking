class State < ApplicationRecord
  belongs_to :country, required: true, foreign_key: "country_id"
  has_many :airports
end
