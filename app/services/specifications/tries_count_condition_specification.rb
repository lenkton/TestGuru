class TriesCountConditionSpecification < AbstractConditionSpecification
  def satisfies?
    tries_for_last_test = @session.user.test_taking_sessions.where('test_taking_sessions.test_id = ?', @session.test.id)

    return unless @session.successful?
    return if tries_for_last_test.filter(&:successful?).size > 1

    tries_for_last_test.size == @parameter.to_i
  end
end
