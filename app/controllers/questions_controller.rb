class QuestionsController < ApplicationController
  def index
    render html: Test.find(params[:test_id].to_i).questions
                     .map { |q| "<a href = #{test_question_path id: q.id} > #{q.text} </a>" }
                     .join('<br>').html_safe
  end

  def show
    question = Question.find(params[:id].to_i)
    render html: "Question: #{question.text}<br>id: #{question.id} <br>"\
      "Answers:<br>#{question.answers.map(&:text).join('<br>')}".html_safe
  end
end
