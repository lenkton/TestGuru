class GistsController < ApplicationController
  def create
    @test_taking_session = TestTakingSession.find(params[:test_taking_session_id])

    result = GistQuestionService.new(@test_taking_session.current_question).call

    @gist = Gist.new(gist_hash: result.id,
                     creator: current_user,
                     question: @test_taking_session.current_question)

    flash_options = if @gist.save
                      { notice: t('.success', link: @gist.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_taking_session, flash_options
  end
end
