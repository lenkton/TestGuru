module Badges
  class Badges::AbstractConditionSpecification
    def initialize(session, parameter)
      @test_taking_session = session
      @parameter = parameter
    end

    def satisfies?
      raise "satisfies? is not implemented in the #{self.class}"
    end

    def already_has_badge?
      @test_taking_session
        .user
        .badges
        .where(
          badges: {
            condition_type: self.class::CONDITION_TYPE,
            condition_parameter: @parameter
          }
        )
        .any?
    end
  end
end
