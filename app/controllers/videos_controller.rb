class VideosController < ApplicationController
  def new
    if params[:errorId]
      Video.find(params[:errorId]).delete rescue nil
      flash.now[:alert] = 'Invalid repository url! Try another one please.'
    end
  end

  def create
    repo_hash = Digest::SHA1.hexdigest(params[:video][:repo].downcase)

    begin
      @video = Video.find(repo_hash)
    rescue Couchbase::Error::NotFound
      @video = Video.create params[:video].merge(id: repo_hash, created_at: Time.now)
      VideoWorker.perform_async @video.id
    end

    redirect_to video_path(@video)
  end

  def show
    @video = Video.find params[:id]
  end

  def status
    @video = Video.find params[:id]

    render json: {status: @video.status, id: @video.id}
  end
end
