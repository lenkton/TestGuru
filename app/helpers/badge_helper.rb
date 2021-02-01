module BadgeHelper
  def possession_tag(badge)
    return 'not-possessed' unless badge.rewarded_users.include?(current_user)
  end
end
