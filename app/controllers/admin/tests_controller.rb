class Admin::TestsController < Admin::BaseController
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = current_user

    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def show
    @test = Test.find(params[:id])
  end

  private

  def test_params
    params.require(:test).permit(:name, :category_id, :level)
  end
end
