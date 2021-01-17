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

    @gist = Gist.new(gist_hash: result.id,
                     creator: current_user,
                     question: @session.current_question)

    flash_options = if @gist.save
                      { notice: t('.success', link: @gist.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @session, flash_options
  end

  private

  def find_session
    @session = TestTakingSession.find(params[:id])
  end
end
