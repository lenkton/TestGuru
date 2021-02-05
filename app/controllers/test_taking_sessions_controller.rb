class TestTakingSessionsController < ApplicationController
  before_action :find_session, only: %i[show result update]
  def show
  end

  def result
  end

  def update
    @session.accept!(params[:answer_ids])

    if @session.is_completed?
      badges_service = BadgesGrantingService.new(@session)
      badges_service.call

      flash[:notice] = badges_service.new_badges_notice

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
