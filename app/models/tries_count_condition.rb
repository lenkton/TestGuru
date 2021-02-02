class TriesCountCondition < Condition
  # needs addiitonal field in the db
  validates :tries_count, presence: true

  def met_for?(user)
    last_session = user.test_taking_sessions.order(:updated_ad, :acs).last
    tries_for_last_test = user.test_taking_sessions.where('test_taking_sessions.test_id = ?', last_session.test.id)

    return unless last_session.successful?
    return if tries_for_last_test.filter(&:successful?).size > 1

    tries_for_last_test.size == tries_count
  end
end
