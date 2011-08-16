class AdminController < ApplicationController
  def vote
  	@deputies = Deputy.order(:lastname).all
  	@texts = Text.order(:code).all
  end
  
  def save_votes
    @text = Text.find(params[:text][:id])
    @text.votes.each { |v| v.destroy }
    params[:vote].each do |k,v|
    	if (v != "noshow") then
    		vote = 0
    		case v
    			when "no"
    				vote = -1
    			when "yes"
    				vote = 1
    			else
    				vote = 0
	    	end
  			Vote.create({:text_id => @text.id, :deputy_id => k, :vote => vote, :delegate_id => params[:proxy][k]}).save!
    	end
    end
  	redirect_to @text
  end

end
