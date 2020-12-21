module ApplicationHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.test.name} question"
    else
      "Create new #{question.test.name} question"
    end
  end

  def current_year
    Time.now.year
  end
end
