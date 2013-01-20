class VideoWorker
  include Sidekiq::Worker

  def perform(video_id)
    video = Video.find video_id

    Rails.logger.info "Processing video: #{video_id}"
    GitProcessor.clone video
    Rails.logger.info "Processed video: #{video_id}"

    Rails.logger.info "Generating video: #{video_id}"
    VideoProcessor.generate video unless video.is? Video::FAILED
    Rails.logger.info "Generated video: #{video_id}"
  end
end
