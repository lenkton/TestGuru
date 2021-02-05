class NewBadgesNotificationService
  def self.call(badges)
    return unless badges&.any?

    I18n.t(
      'new_badges_notification_service.user_reveived_badges',
      names: badges.map(&:name).join(', ')
    )
  end
end
