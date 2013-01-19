module VideoProcessor
  def self.generate(video)
    video.status = :ready
    video.save

    system "gource #{video.repo_path} -f -640x480 --bloom-multiplier 1.2  -c 4 -s 1 -o - | ffmpeg -y -r 25 -f image2pipe -vcodec ppm -i - -vcodec libvpx -b 10M #{video.repo_path}/gource.webm"
  end
end
