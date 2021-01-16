class GistQuestionService
  def initialize(question, client = nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.gist_description', test_name: @test.name),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.text]
    content += @question.answers.pluck(:text)
    content.join("\n")
  end
end
