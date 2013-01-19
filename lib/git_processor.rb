require 'git'

module GitProcessor
  def self.clone(video)
    Git.clone video.repo, video.repo_path
  end
end
