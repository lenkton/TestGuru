class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  belongs_to :question

  validates :question, :text, :correct, presence: true
end
