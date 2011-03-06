class StaticController < ApplicationController
  def info
  end

  def faq
  end

  def contact
  end

  def license
  end

  def disclaimer
  end
  
  def index
    @dossiers = Text.limit(5).order("updated_at")
  end

end
