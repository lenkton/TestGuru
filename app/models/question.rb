class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :text, :test, presence: true
  validates :answers, length: { in: 1..4 }
end
