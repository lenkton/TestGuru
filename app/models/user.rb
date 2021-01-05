class User < ApplicationRecord
  has_many :tests, foreign_key: :author_id, dependent: :destroy
  has_many :test_taking_sessions, dependent: :destroy
  has_many :taken_tests, through: :test_taking_sessions, source: :test

  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: {message: 'Пользователь с таким именем уже существует!'}
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: 'Неверный формат адреса электронной почты!'}

  def participated_tests(level)
    taken_tests.of_level(level)
  end

  def test_taking_session(test)
    test_taking_sessions.order(id: :desc).find_by(test_id: test.id)
  end
end
