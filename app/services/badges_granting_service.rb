class BadgesGrantingService
  def initialize(user)
    @user = user
  end

  def new_badges
    @new_badges ||= (Badge.all - @user.badges).filter { |badge| badge.condition.met_for?(@user) }
  end

  def call
    new_badges.each { |badge| badge.grant_to(@user)}
  end
end
