module VideoProcessor
  def self.generate(video)
    video.change_status! Video::READY

    system "cd #{Rails.root.join video.repo_path} && gource -640x480 -o - | ffmpeg -y -r 25 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 10000K gource.webm"
  end
end
