class TestTakingSessionsController < ApplicationController
  before_action :find_session, only: %i[show result update gist]
  def show
  end

  def result
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

  def gist
    result = GistQuestionService.new(@session.current_question).call

    flash_options = if result
      {notice: t('.success', link: result[:html_url])} #... result[:html_url]
    else
      {alert: t('.failure')}
    end

    redirect_to @session, flash_options
  end

  private

  def find_session
    @session = TestTakingSession.find(params[:id])
  end
end
