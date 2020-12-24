class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    @test = Test.find(params[:id])
    @user = User.first # for the time being
    @user.taken_tests.push(@test)
    redirect_to @user.test_taking_session(@test)
  end
end
