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
    expire_fragment("texts_show_#{@text.id}")
  	redirect_to @text
  end
  
  def calculate_favs
  	i = 0
  	texts = Text.all
  	texts.sort! { |a,b| b.fav_count <=> a.fav_count }
  	texts.each do |t|
  		if i < 15 then
  			t.favorite = i + 1
  		else
  			t.favorite = 99
  		end
  		t.save!
  		i += 1
  	end
  	
  	render :text => "OK!"
  end
  
  def cache_percentages
  	Deputy.all.each do |d|
  		d.presence_cache = d.presence
  		d.delegations_rate_cache = d.delegations_rate
  		d.save!
  	end
  	
  	render :text => "OK!"
  end
  
  def cache_active
  	Deputy.all.each do |d|
  		d.active_cache = d.active?
  		d.save!
  	end
  	
  	render :text => "OK!"
  end
  
  def purge_cache
    d = Deputy.where("last_purge < ?", DateTime.now - 1.hours).order(:last_purge)[0]
    expire_fragment("deputies_show_#{d.id}")
    d.last_purge = DateTime.now
    d.save
    redirect_to d
  end

end
