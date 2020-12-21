class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_test_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question =  @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def resque_with_test_not_found
    render html: 'Теста или вопроса с таким номером не существует'
  end
end
