class TestsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.taken_tests.push(@test)
    redirect_to current_user.test_taking_session(@test)
  end
end
