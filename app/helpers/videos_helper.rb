module VideosHelper
  SHOW_AMOUNT = 10

  def show_latest_videos
    videos = LatestVideos.list.map { |id| Video.find(id) rescue nil }.compact[0...SHOW_AMOUNT]
    render partial: 'latest_video', collection: videos
  end
end
