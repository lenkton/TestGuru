module QuestionsHelper
  def question_link(question)
    link_name = truncate(question.text, length: 25)

    link_to link_name, admin_question_path(question)
  end
end
