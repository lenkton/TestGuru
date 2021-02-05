class BadgesGrantingService
  CONDITIONS = {
    tries_count: TriesCountConditionSpecification,
    category: CategoryConditionSpecification,
    level: LevelConditionSpecification
  }.freeze

  def self.call(session)
    Badge.find_each do |badge|
      condition = CONDITIONS[badge.condition_type.to_sym].new(session, badge.condition_parameter)
      badge.grant_to(session.user) if (condition.satisfies?)
    end

    @new_badges
  end

  private

  def give_badge(badge, user)
    badge.grant_to(user)
    @new_badges ||= []
    @new_badges << badge
  end
end
