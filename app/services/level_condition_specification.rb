class LevelConditionSpecification < AbstractConditionSpecification
  def satisfies?
    @session.success && Test.where(level: @parameter) - @session.user.test_taking_sessions.successful.map(&:test) == []
  end
end
