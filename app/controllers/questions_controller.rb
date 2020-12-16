class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]

  rescue_from ActiveRecord::RecordNotFound, with: :resque_with_test_not_found
  
  def index
    render html: @test.questions
                     .map { |q| "<a href = #{question_path id: q.id} > #{q.text} </a>" }
                     .join('<br>').html_safe
  end

  def show
    question = Question.find(params[:id])
    render html: "Question: #{question.text}<br>id: #{question.id} <br>"\
      "Answers:<br>#{question.answers.map(&:text).join('<br>')}".html_safe
  end

  def new
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    render html: "Вопрос был успешно удалён!"
  end

  private

  def question_params
    params[:question][:test_id] = params[:test_id]
    params.require(:question).permit(:text, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def resque_with_test_not_found
    render html: 'Теста с таким номером не существует'
  end
end
