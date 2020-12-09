class Answer < ApplicationRecord
  scope :correct, -> { where(correct: true) }

  belongs_to :question

  validates :text, :correct, presence: true
end
