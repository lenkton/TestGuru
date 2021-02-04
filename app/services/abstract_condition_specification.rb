class AbstractConditionSpecification
  def initialize(session, parameter)
    @session = session
    @parameter = parameter
  end

  def satisfies?
    raise "satisfies? is not implemented in the #{self.class}"
  end
end