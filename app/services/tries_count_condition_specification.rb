class TriesCountConditionSpecification < AbstractConditionSpecification
  def satisfies?
    tries_for_last_test = @session.user.test_taking_sessions.where('test_taking_sessions.test_id = ?', @session.test.id)

    return unless @session.success
    return if tries_for_last_test.filter(&:success).size > 1

    tries_for_last_test.size == @parameter.to_i
  end
end
