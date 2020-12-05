class User < ApplicationRecord
  def participated_tests(level)
    Test.joins('JOIN test_taking_sessions ON tests.id = test_taking_sessions.test_id')
        .where(level: level).where(test_taking_sessions: { user_id: id })
  end
end
