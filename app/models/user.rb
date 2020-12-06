class User < ApplicationRecord
  has_many :tests, foreign_key: :author_id

  def participated_tests(level)
    Test.joins('JOIN test_taking_sessions ON tests.id = test_taking_sessions.test_id')
        .where(level: level).where(test_taking_sessions: { user_id: id })
  end
end
