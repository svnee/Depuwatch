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
  
  def report
    @report = Report.new
    @page = request.referer
  end
  
  def report_sent
    @report = Report.create(params[:report])
    
    respond_to do |format|
      if @report.save
        format.html {}
        format.xml  { render :xml => @report, :status => :created }
      else
        format.html { render :action => "report" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def missing
  	@texts = Array.new
  	Text.all.each do |t|
  		@texts << t if ((t.votes.size < 1) || (t.votes.size > 60) || (t.votes_contre.size > t.votes_pour.size))
  	end
  end
  
  def search
  end

end
