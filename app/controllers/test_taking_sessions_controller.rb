class TestTakingSessionsController < ApplicationController
  before_action :find_session, only: %i[show result update]
  def show
  end

  def result
  end

  def update
    @test_taking_session.accept!(params[:answer_ids])

    if @test_taking_session.is_completed?
      badges_service = BadgesGrantingService.new(@test_taking_session)
      badges_service.call

      flash[:notice] = badges_service.new_badges_notice

      TestsMailer.completed_test(@test_taking_session).deliver_now
      redirect_to result_test_taking_session_path(@test_taking_session)
    else
      render :show
    end
  end

  private

  def find_session
    @test_taking_session = TestTakingSession.find(params[:id])
  end
end
