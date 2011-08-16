class AdminController < ApplicationController
  def vote
  	@deputies = Deputy.all
  	@texts = Text.order(:code).all
  end
  
  def save_votes
    @text = Text.find(params[:text][:id])
    
    params[:vote].each do |k,v|
    	logger.info "#{k} -> #{v}"
    end
    #@text.votes.each { |v| v.destroy }
    #params[:vote][:pour].each { |i| Vote.create({:text_id => @text.id, :deputy_id => i, :vote => 1}).save! }
    #params[:vote][:contre].each { |i| Vote.create({:text_id => @text.id, :deputy_id => i, :vote => -1}).save! }
    #params[:vote][:abstention].each { |i| Vote.create({:text_id => @text.id, :deputy_id => i, :vote => 0}).save! }
  	redirect_to @text
  end

end
