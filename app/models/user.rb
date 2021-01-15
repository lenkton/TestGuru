class User < ApplicationRecord
  has_many :authored_tests, class_name: :Test, foreign_key: :author_id, dependent: :destroy
  has_many :test_taking_sessions, dependent: :destroy
  has_many :taken_tests, through: :test_taking_sessions, source: :test

  validates :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true, presence: true

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  def participated_tests(level)
    taken_tests.of_level(level)
  end

  def test_taking_session(test)
    test_taking_sessions.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
