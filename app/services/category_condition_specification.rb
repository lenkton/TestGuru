class CategoryConditionSpecification < AbstractConditionSpecification
  def satisfies?
    return if Category.find_by(id: @parameter) != @session.test.category

    Test.where(category_id: 1)
        .joins(:test_taking_sessions)
        .all? do |test|
          test.test_taking_sessions
              .where(user_id: 1, success: true)
              .exists?
        end
  end
end
