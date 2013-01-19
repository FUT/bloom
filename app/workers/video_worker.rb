class VideoWorker
  include Sidekiq::Worker

  def perform(video_id)
    video = Video.find video_id

    GitProcessor.clone video

    VideoProcessor.generate video unless video.is? Video::FAILED
  end
end
