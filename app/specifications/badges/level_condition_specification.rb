module Badges
  class Badges::LevelConditionSpecification < Badges::AbstractConditionSpecification
    CONDITION_TYPE = 'level'
    def satisfies?
      return false if already_has_badge?
      
      @test_taking_session.successful? && Test.where(level: @parameter) - @test_taking_session.user.test_taking_sessions.successful.map(&:test) == []
    end
  end
end
