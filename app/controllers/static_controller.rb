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
  	qry << "deputies.id = #{params[:deputy][:id]}" if (!params[:deputy][:id].empty? && params[:all][:id] != "all")
  	qry << "deputies.party_id = #{params[:party][:id]}" if (!params[:party][:id].empty? && params[:party][:id] != "all")
  	qry << "sessions.id = #{params[:session][:id]}" if (!params[:session][:id].empty? && params[:session][:id] != "all")
  	qry << "topics.id = #{params[:topic][:id]}" if (!params[:topic][:id].empty? && params[:topic][:id] != "all")
  	qry << "votes.vote = 1" if (params[:vote] == "Jo")
  	qry << "votes.vote = -1" if (params[:vote] == "Nee")
  	qry << "votes.vote = 0" if (params[:vote] == "Abstentioun")
  	@texts = Text.joins(:votes => [:deputy]).joins(:seance => :session).joins(:topics).where(qry.join(" AND ")).uniq!
  end
  
  def results_deputies
    qry = Array.new
    qry << "memberships.end < '#{Date.today}'" if params[:active] == "Nee"
    qry << "memberships.start < '#{Date.today}' AND (memberships.end IS NULL OR memberships.end > '#{Date.today}')" if params[:active] == "Jo"
    qry << "deputies.circonscription = '#{params[:bezierk]}'" if (!params[:bezierk].empty? && params[:bezierk] != "all")
    qry << "deputies.party_id = #{params[:party][:id]}" if (!params[:party][:id].empty? && params[:party][:id] != "all")
  	qry << "topics.id = #{params[:topic][:id]}" if (!params[:topic][:id].empty? && params[:topic][:id] != "all")
  	@deputies = Deputy.joins(:memberships).joins(:votes => {:text => :topics}).where(qry.join(" AND ")).uniq!
  end

end
