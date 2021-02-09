module TestTakingSessionsHelper
  def time_left(session)
    (session.test.time_limit - session.taking_time).ceil
  end
end
