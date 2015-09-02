class AdvertisementsController < ApplicationController
  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def index
    @advertisements = Advertisement.all
  end
end
