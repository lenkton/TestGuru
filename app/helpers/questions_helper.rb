module QuestionsHelper
  def question_link(question)
    link_name = question_link_name(question)

    link_to link_name, admin_question_path(question)
  end

  private

  def question_link_name(question)
    if question.text.length > 25
      question.text[0, 25]
    else
      question.text
    end
  end
end
