class QuestionsController < ApplicationController
  def index
    render html: Test.find(params[:test_id].to_i).questions
                     .map { |q| "<a href = #{test_question_path id: q.id} > #{q.text} </a>" }
                     .join('<br>').html_safe
  end
end
