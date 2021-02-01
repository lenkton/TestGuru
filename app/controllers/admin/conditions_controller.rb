class Admin::ConditionsController < Admin::BaseController
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  def index
    @conditions = Condition.all
  end

  def show
  end

  def new
    @condition = Condition.new
  end

  def edit
  end

  def create
    @condition = Condition.create!(condition_params)
    @condition.required_test_ids = params[:condition][:test_ids] if @condition.is_a?(SetOfTestsSolvedCondition)

    if @condition.save
      flash[:notice] = 'Condition was successfully created.'
      redirect_to admin_condition_path(@condition)
    else
      render :new
    end
  end

  def update
    @condition.required_test_ids = params[:condition][:test_ids] if @condition.is_a?(SetOfTestsSolvedCondition)

    if @condition.update(condition_params)
      flash[:notice] = 'Condition was successfully updated.'
      redirect_to admin_condition_path(@condition)
    else
      render :edit
    end
  end

  def destroy
    @condition.destroy

    flash[:notice] = 'Condition was successfully destroyed.'
    redirect_to admin_conditions_path
  end

  private

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def condition_params
    params.require(:condition).permit(:name, :type, :tries_count)
  end
end
