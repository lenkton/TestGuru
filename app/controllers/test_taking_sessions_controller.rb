class TestTakingSessionsController < ApplicationController
  before_action :find_session, only: %i[show result update]
  def show
  end

  def result
  end

  def update
    @session.accept!(params[:answer_ids])

    if @session.is_completed?
      new_badges = BadgesGrantingService.call(@session)

      flash[:notice] = NewBadgesNotificationService.call(new_badges)

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
end
