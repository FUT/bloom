module VideoProcessor
  def self.generate(video)
    video.change_status! Video::READY

    Rails.logger.info "In video precessing: #{video.id}"
    system "cd #{Rails.root.join video.repo_path} && xvfb-run -a -s \"-screen 0 640x480x24\" gource -640x480 -o - | ffmpeg -y -r 25 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 10000K gource.webm"
  end
end
