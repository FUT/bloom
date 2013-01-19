class VideoWorker
  include Sidekiq::Worker

  def perform(video_id)
    puts 'a'
  end
end