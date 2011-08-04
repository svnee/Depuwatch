class RatingsController < ApplicationController
  def create
    r = Rating.new
    r.text_id = params[:text_id]
    r.save
    respond_to do |format|
      format.html {redirect_to Text.find(params[:id])}
      format.js {}
    end
  end
end
