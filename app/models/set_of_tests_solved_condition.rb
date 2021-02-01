class SetOfTestsSolvedCondition < Condition
  has_many :test_completion_requirements, foreign_key: :condition_id, dependent: :destroy
  has_many :required_tests, through: :test_completion_requirements, foreign_key: :condition_id, source: :test

  def met_for?(user)
    sessions =
      TestTakingSession.joins(
        'JOIN test_completion_requirements 
        ON test_completion_requirements.test_id = test_taking_sessions.test_id'
      )
                       .where(user: user)
                       .filter(&:successful?)

    successful_tests = sessions.map(&:test)

    required_tests - successful_tests == []
  end
end
