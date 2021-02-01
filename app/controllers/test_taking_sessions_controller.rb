class TestTakingSessionsController < ApplicationController
  before_action :find_session, only: %i[show result update]
  def show
  end

  def result
    check_badges_for(@session.user)
  end

  def update
    @session.accept!(params[:answer_ids])

    if @session.is_completed?
      TestsMailer.completed_test(@session).deliver_now
      redirect_to result_test_taking_session_path(@session)
    else
      render :show
    end
  end

  private

  def find_session
    @session = TestTakingSession.find(params[:id])
  end

  def check_badges_for(user)
    flash[:notice] =
      (Badge.all - user.badges)
           .filter { |badge| badge.condition.met_for?(user) }
           .reduce(nil) do |notice, badge|
              notice ||= ''
              badge.grant_to(user)
              notice + "Yoooo, you just got a #{badge.name} badge! Greetings!"
            end
  end
end
