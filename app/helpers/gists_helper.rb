module GistsHelper
  def gist_link(gist)
    link_to gist.gist_hash,
            gist.url,
            rel: :nofollow,
            target: :_blank
  end
end
