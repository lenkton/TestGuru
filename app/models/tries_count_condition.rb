class TriesCountCondition < Condition
  # needs addiitonal field in the db
  validates :tries_count, presence: true

  def met_for?(user)
    return unless user.test_taking_sessions.order(:updated_ad, :acs).last.successful?
    return if user.test_taking_sessions.filter(&:successful?).size > 1

    user.test_taking_sessions.size <= tries_count
  end
end
