class LatestVideos
  ID = 'latest_videos'

  class << self
    def add(repo)
      replace(list << repo)
    end

    def list
      Video.find(ID).repo.reverse rescue []
    end

    def remove(repo)
      replace(list - [repo])
    end

    private
    def replace(repos)
      videos = Video.find(ID) rescue Video.new(id: ID)
      videos.repo = repos.uniq
      videos.save
    end
  end
end
