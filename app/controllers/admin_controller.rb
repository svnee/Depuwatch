class AdminController < ApplicationController
  def vote
  	@deputies = Deputy.all
  	@texts = Text.order(:code).all
  end
  
  def save_votes
  	
  end

end
