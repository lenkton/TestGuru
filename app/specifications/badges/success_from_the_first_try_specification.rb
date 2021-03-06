class Badges::SuccessFromTheFirstTrySpecification < Badges::AbstractConditionSpecification
  def satisfies?
    @test_taking_session.success && first_try?
  end

  private

  def first_try?
    TestTakingSession.where(
      user: @test_taking_session.user,
      test: @test_taking_session.test)
      .size
      .equal?(1)
  end
end
