class AdminController < ApplicationController
  def vote
  	@deputies = Deputy.all
  	@texts = Text.all
  end
  
  def save_votes
  	
  end

end
