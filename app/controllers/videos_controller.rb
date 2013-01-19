class VideosController < ApplicationController
  def new
  end

  def create
    @video = Video.create params[:video]

    VideoWorker.new.perform @video.id

    redirect_to video_path(@video)
  end

  def show
    @video = Video.find params[:id]
  end


  def new

  end

  def status
    @video = Video.find params[:id]

    render json: { video: @video.is?(Video::READY) && render_to_string(@video).to_json }
  end
end
