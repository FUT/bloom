class VideosController < ApplicationController
  def new
  end

  def create
    @video = Video.create params[:video]

    VideoWorker.perform_async @video.id

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
