class User < ApplicationRecord
  def participated_tests(level)
    TestTakingSession.where(user_id: id).includes(:test).where(tests: { level: level }).distinct.map(&:test)
  end
end
