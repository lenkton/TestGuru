class Badges::TriesCountConditionSpecification < Badges::AbstractConditionSpecification
  def satisfies?
    succeeded_now? && !succeeded_before? && had_exact_number_of_tries?
  end

  def succeeded_now?
    @test_taking_session.successful?
  end

  def succeeded_before?
    tries_for_last_test
      .slice(0..-2)
      .any?(&:successful?)
  end

  def had_exact_number_of_tries?
    tries_for_last_test
      .size
      .equal?(@parameter.to_i)
  end

  def tries_for_last_test
    @tries_for_last_test =
      @test_taking_session
        .user
        .test_taking_sessions
        .where(
          'test_taking_sessions.test_id = ?',
          @test_taking_session.test.id
        )
  end
end
