module Badges
  class Badges::LevelConditionSpecification < Badges::AbstractConditionSpecification
    def satisfies?
      @test_taking_session.successful? && Test.where(level: @parameter) - @test_taking_session.user.test_taking_sessions.successful.map(&:test) == []
    end
  end
end
