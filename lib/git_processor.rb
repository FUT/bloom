module GitProcessor
  def self.clone(video)
    begin
      Git.clone video.repo, video.repo_path
    rescue Git::GitExecuteError
      video.change_status! Video::FAILED
    end
  end
end
