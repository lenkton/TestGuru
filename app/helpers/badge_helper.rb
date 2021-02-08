module BadgeHelper
  def granted?(badge)
    badge.rewarded_users.include?(current_user)
  end
end
