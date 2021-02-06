module Badges
  class Badges::TriesCountConditionSpecification < Badges::AbstractConditionSpecification
    def satisfies?
      tries_for_last_test = @test_taking_session.user
                                    .test_taking_sessions
                                    .where('test_taking_sessions.test_id = ?', @test_taking_session.test.id)

      @test_taking_session.successful? && tries_for_last_test.slice(0..-2).all? do |try|
        !try.successful?
      end && tries_for_last_test.size.equal?(@parameter.to_i)
    end
  end
end
