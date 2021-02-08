class Badges::CategoryConditionSpecification < Badges::AbstractConditionSpecification
  CONDITION_TYPE = 'category'

  def satisfies?
    return false if already_has_badge?
    return false if Category.find(@parameter) != @test_taking_session.test.category

    tests = Category.find(@parameter).tests
    tests.size == passed_tests.size
  end

  def passed_tests
    Test
      .where(category_id: @parameter)
      .joins(:test_taking_sessions)
      .where(test_taking_sessions: { user: @test_taking_session.user, success: true })
      .uniq
  end
end
