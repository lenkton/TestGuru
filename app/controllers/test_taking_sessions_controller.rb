class TestTakingSessionsController < ApplicationController
  before_action :find_session, only: %i[show result update]
  def show
  end

  def result
  end

  def update
    @session.accept!(params[:answer_ids])

    if @session.is_completed?
      badges_service = BadgesGrantingService.new(@session.user)
      badges_service.call

      if badges_service.new_badges.any?
        flash[:notice] = t('.user_reveived_badges', names: badges_service.new_badges.map(&:name).join(', '))
      end
      
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
