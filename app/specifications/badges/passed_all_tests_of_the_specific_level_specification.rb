class Badges::PassedAllTestsOfTheSpecificLevelSpecification < Badges::AbstractConditionSpecification
  CONDITION_TYPE = 'level'
  def satisfies?
    return false if already_has_badge?

    @test_taking_session.successful? && passed_all_tests?
  end

  private

  def passed_all_tests?
    Test.where(level: @parameter).size == passed_tests.size
  end

  def passed_tests
    Test
      .where(level: @parameter)
      .joins(:test_taking_sessions)
      .where(test_taking_sessions: { user: @test_taking_session.user, success: true })
      .uniq
  end
end
