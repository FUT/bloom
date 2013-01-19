module VideoProcessor
  def self.generate(video)
    video.change_status! Video::READY

    system "gource #{video.repo_path} -f -640x480 --bloom-multiplier 1.2  -c 4 -s 1 -o - | ffmpeg -y -r 25 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 10M #{video.src_path}"
  end
end
