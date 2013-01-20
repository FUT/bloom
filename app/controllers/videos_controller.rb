class VideosController < ApplicationController
  def new
  end

  def create
    repo_hash = Digest::SHA1.hexdigest(params[:video][:repo].downcase)

    begin
      @video = Video.find(repo_hash)
    rescue Couchbase::Error::NotFound
      @video = Video.create params[:video].merge(:id => repo_hash)
      VideoWorker.perform_async @video.id
    end

    redirect_to video_path(@video)
  end

  def show
    @video = Video.find params[:id]
  end


  def new

  end

  def status
    @video = Video.find params[:id]

    render text: @video.status
  end
end
