module BadgeHelper
  def possessed?(badge)
    badge.rewarded_users.include?(current_user)
  end
end
