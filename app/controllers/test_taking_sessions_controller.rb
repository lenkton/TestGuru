class TestTakingSessionsController < ApplicationController
  def show
    @session = TestTakingSession.find(params[:id])
  end

  def result
  end

  def update
  end
end
