module GistsHelper
  def question_link(question)
    link_name = question_link_name(question)

    link_to link_name, admin_question_path(question)
  end

  def gist_link(gist)
    link_to gist.gist_hash,
            gist.url,
            rel: :nofollow,
            target: :_blank
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
