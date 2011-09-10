class Api::PoliticiansController < ApplicationController
  skip_before_filter :authenticate
  
  def index
    @politicians = Deputy.all
    
    respond_to do |format|
      format.html { render :text => "Please use the API only with application/xml", :status => :see_other }
      format.xml  { render :xml => @politicians.to_xml(:only => [:id, :name, :start, :end, :pc_profile], :methods => [:partei, :bezierk, :active], :include => [:memberships], :skip_instruct => true, :root => 'politicians') }
      format.json { render :json => @politicians.to_json(:only => [:id, :name, :start, :end, :pc_profile], :methods => [:partei, :bezierk, :active], :include => [:memberships]).gsub!(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}}
    end
  end
  
  def show
    @politician = Deputy.find(params[:id])
    
    respond_to do |format|
      format.html { render :text => "Please use the API only with application/xml", :status => :see_other }
      format.xml  { render :xml => @politician.to_xml(:only => [:id, :name, :start, :end, :pc_profile], :methods => [:partei, :bezierk, :active, :votes], :include => [:memberships, :votes], :skip_instruct => true, :root => 'politician') }
      format.json { render :json => @politician.to_json(:only => [:id, :name, :start, :end, :pc_profile], :methods => [:partei, :bezierk, :active], :include => [:memberships], :skip_instruct => true, :root => 'politician').gsub!(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}}
    end
  end
end
