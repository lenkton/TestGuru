class Condition < ApplicationRecord
  has_many :badges, dependent: :destroy
end
