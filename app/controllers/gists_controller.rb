class GistsController < ApplicationController
  def create
    @session = TestTakingSession.find(params[:test_taking_session_id])

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
end
