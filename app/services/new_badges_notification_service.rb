class NewBadgesNotificationService
  def self.call(session)
    new_badges = session.user.rewardings.where('rewardings.updated_at > ?', session.updated_at).map(&:badge)
    if new_badges.any?
      I18n.t('new_badges_notification_service.user_reveived_badges',  names: new_badges.map(&:name).join(', '))
    end
  end
end
