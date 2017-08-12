class State < ApplicationRecord
  belongs_to :country, optional: true, foreign_key: "country_id"
  has_many :airports
end
