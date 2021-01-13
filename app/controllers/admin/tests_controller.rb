class Admin::TestsController < Admin::BaseController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end
end
