class VideoWorker
  include Sidekiq::Worker

  def perform(video_id)
    video = Video.find video_id

    GitProcessor.clone video

    VideoProcessor.generate video
  end
end
