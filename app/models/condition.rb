class Condition < ApplicationRecord
  has_many :badges, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :type, presence: true
end
