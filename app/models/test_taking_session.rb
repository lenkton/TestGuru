class TestTakingSession < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: :Question

  before_validation :before_validation_set_first_question, on: :create

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end
end
