class QuestionsController < ApplicationController
  before_action :find_test
  
  def index
    render html: test.questions
                     .map { |q| "<a href = #{test_question_path id: q.id} > #{q.text} </a>" }
                     .join('<br>').html_safe
  end

  def show
    question = Question.find(params[:id].to_i)
    render html: "Question: #{question.text}<br>id: #{question.id} <br>"\
      "Answers:<br>#{question.answers.map(&:text).join('<br>')}".html_safe
  end

  def new
  end

  def create
    q = Question.new(params.require(:question).permit(:text))
    q.test = test
    q.save
    render html: "Вопрос \"#{q.text}\" был успешно создан!<br><a href=\".\">See the test</a>".html_safe
  end

  def destroy
    Question.find(params[:id].to_i).destroy
    render html: "Вопрос был успешно удалён!"
  end

  private

  attr_accessor :test

  def find_test
    @test = Test.find(params[:test_id].to_i)
  end
end
