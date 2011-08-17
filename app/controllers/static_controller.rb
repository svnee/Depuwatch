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
  
  def results_texts
  	qry = Array.new
  	qry << "deputies.id = #{params[:deputy][:id]}" if (!params[:deputy][:id].empty?)
  	qry << "deputies.party_id = #{params[:party][:id]}" if (!params[:party][:id].empty?)
  	qry << "sessions.id = #{params[:session][:id]}" if (!params[:session][:id].empty?)
  	qry << "topics.id = #{params[:topic][:id]}" if (!params[:topic][:id].empty?)
  	qry << "votes.vote = 1" if (params[:vote] == "Jo")
  	qry << "votes.vote = -1" if (params[:vote] == "Nee")
  	qry << "votes.vote = 0" if (params[:vote] == "Abstentioun")
  	@texts = Text.joins(:votes => [:deputy]).joins(:seance => :session).joins(:topics).where(qry.join(" AND "))
  end
  
  def results_deputies
  end

end
