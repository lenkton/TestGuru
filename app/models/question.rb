class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :test_taking_sessions, dependent: :destroy, foreign_key: :current_question

  validates :text, presence: true
end
