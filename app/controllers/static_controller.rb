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

end
