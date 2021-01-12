class Admin::TestsController < Admin::BaseController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end
end
