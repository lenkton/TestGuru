module Badges
  class Badges::CategoryConditionSpecification < Badges::AbstractConditionSpecification
    def satisfies?
      return false if Category.find(@parameter) != @test_taking_session.test.category

      tests = Category.find(@parameter).tests
      tests.size == passed_tests(tests).size
    end

    def passed_tests(tests)
      Test
        .joins(:test_taking_sessions)
        .where(test_taking_sessions: { user: @test_taking_session.user, success: true })
        .merge(tests)
        .uniq
    end
  end
end