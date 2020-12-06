class User < ApplicationRecord
  has_many :tests, foreign_key: :author_id, dependent: :destroy
  has_many :test_taking_sessions, dependent: :destroy
  has_many :taken_tests, through: :test_taking_sessions, source: :test

  def participated_tests(level)
    taken_tests.where(level: level)
  end
end
