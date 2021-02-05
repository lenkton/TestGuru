class TriesCountConditionSpecification < AbstractConditionSpecification
  def satisfies?
    tries_for_last_test = @session.user
                                  .test_taking_sessions
                                  .where('test_taking_sessions.test_id = ?', @session.test.id)

    @session.successful? && tries_for_last_test.slice(0..-2).all? do |try|
      !try.successful?
    end && tries_for_last_test.size.equal?(@parameter.to_i)
  end
end
