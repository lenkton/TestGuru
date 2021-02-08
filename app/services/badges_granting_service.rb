class BadgesGrantingService
  CONDITIONS = {
    'first_try' => Badges::SuccessFromTheFirstTrySpecification,
    'category' => Badges::CategoryConditionSpecification,
    'level' => Badges::LevelConditionSpecification
  }.freeze

  def initialize(session)
    @test_taking_session = session
    @new_badges = []
  end

  def call
    Badge.find_each do |badge|
      condition = CONDITIONS[badge.condition_type].new(@test_taking_session, badge.condition_parameter)
      give_badge(badge, @test_taking_session.user) if condition.satisfies?
    end
  end

  def new_badges_notice
    return unless @new_badges.any?

    I18n.t(
      'new_badges_granting_service.user_reveived_badges',
      names: @new_badges.map(&:name).join(', ')
    )
  end

  private

  def give_badge(badge, user)
    user.badges << badge
    @new_badges << badge
  end
end
