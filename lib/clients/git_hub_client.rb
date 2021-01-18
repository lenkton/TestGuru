class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com/'
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @git_hub_client = setup_git_hub_client
  end

  def create_gist(params)
    @git_hub_client.create_gist(params)
  end

  private

  def setup_git_hub_client
    Octokit::Client.new(netrc: true)
  end
end
