class TestTakingSession < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: :Question, optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question
  before_update :before_update_save_success, if: :is_completed?

  scope :successful, ->() { where(success: true) }

  MINIMUM_SUCCESS_RATE = 85

  def success_rate
    100 * correct_questions / test.questions.count
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def questions_total
    test.questions.count
  end

  def is_completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def taking_time
    Time.current - created_at
  end

  private

  def successful?
    success_rate >= MINIMUM_SUCCESS_RATE
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def before_update_save_success
    self.success = (successful? && (!test.time_limit || test.time_limit > taking_time))
  end

  def correct_answer?(answer_ids)
    answer_ids.present? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
