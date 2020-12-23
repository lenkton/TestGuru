module ApplicationHelper
  def question_header(question)
    if question.persisted?
      "Edit #{question.test.name} question"
    else
      "Create new #{question.test.name} question"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}/", rel: :nofollow, target: :_blank
  end
end
