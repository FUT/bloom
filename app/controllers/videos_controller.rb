class VideosController < ApplicationController
  def new
  end

  def create
    @video = Video.create params[:video]

    VideoWorker.new.perform @video.id
  end


  def new

  end

  def status
    render json: Video.find(params[:id]).attributes.to_json
  end
end
