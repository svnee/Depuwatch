class AdminController < ApplicationController
  def vote
  	@deputies = Deputy.all
  	@texts = Text.all.order(:code)
  end
  
  def save_votes
  	
  end

end
