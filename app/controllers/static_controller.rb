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
    @dossiers = Text.order("updated_at DESC").limit(15)
    @top = Text.where('favorite < 99').order(:favorite)
    @featured = Text.where('featured <> ""').order(:updated_at).limit(15)
    @deputies = Deputy.where('active_cache <> 0').order(:lastname)
  end
  
  def featured
    @dossiers = Text.where('featured <> ""').order(:updated_at)
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
  		@texts << t if ((t.link_memorial.empty?) || (t.title.empty?) || (t.seance.nil?) || (t.seance.compte_rendu.empty?))
  	end
  end
  
  def search
  end
  
  def results_texts
  	qry = Array.new
  	qry << "deputies.id = #{params[:deputy][:id]}" if (!params[:deputy][:id].empty? && params[:deputy][:id] != "all")
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
    qry << "deputies.active_cache <> 0" if params[:active] == "Jo"
    qry << "deputies.active_cache = 0" if params[:active] == "Nee"
    qry << "deputies.presence_cache >= #{params[:presence]}" if !params[:presence].empty?
    qry << "deputies.delegations_rate_cache >= #{params[:delegations]}" if !params[:delegations].empty?
    qry << "deputies.circonscription = '#{params[:bezierk]}'" if (!params[:bezierk].empty? && params[:bezierk] != "all")
    qry << "deputies.party_id = #{params[:party][:id]}" if (!params[:party][:id].empty? && params[:party][:id] != "all")
  	@query = qry.join(" AND ")
  	@deputies = Deputy.where(@query)
  end

end
