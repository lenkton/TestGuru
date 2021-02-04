class CategoryConditionSpecification < AbstractConditionSpecification
  def satisfies?
    return if Category.find_by(id: @parameter) != @session.test.category

    Category.find_by(id: @parameter).tests - @session.user.test_taking_sessions.successful.map(&:test) == []
  end
end
