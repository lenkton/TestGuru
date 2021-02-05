require_relative './specifications/abstract_condition_specification'
require_relative './specifications/category_condition_specification'
require_relative './specifications/level_condition_specification'
require_relative './specifications/tries_count_condition_specification'

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
