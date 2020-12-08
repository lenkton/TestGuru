class Answer < ApplicationRecord
  belongs_to :question
  scope :right, -> { where(correct: true) }
  scope :correct, -> { right }

  validates :question, :text, presence: true
end
