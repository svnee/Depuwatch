class LegislationsController < ApplicationController
  # GET /legislations
  # GET /legislations.xml
  def index
    @legislations = Legislation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @legislations }
    end
  end

  # GET /legislations/1
  # GET /legislations/1.xml
  def show
    @legislation = Legislation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @legislation }
    end
  end

  # GET /legislations/new
  # GET /legislations/new.xml
  def new
    @legislation = Legislation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @legislation }
    end
  end

  # GET /legislations/1/edit
  def edit
    @legislation = Legislation.find(params[:id])
  end

  # POST /legislations
  # POST /legislations.xml
  def create
    @legislation = Legislation.new(params[:legislation])

    respond_to do |format|
      if @legislation.save
        format.html { redirect_to(@legislation, :notice => 'Legislation was successfully created.') }
        format.xml  { render :xml => @legislation, :status => :created, :location => @legislation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @legislation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /legislations/1
  # PUT /legislations/1.xml
  def update
    @legislation = Legislation.find(params[:id])

    respond_to do |format|
      if @legislation.update_attributes(params[:legislation])
        format.html { redirect_to(@legislation, :notice => 'Legislation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @legislation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /legislations/1
  # DELETE /legislations/1.xml
  def destroy
    @legislation = Legislation.find(params[:id])
    @legislation.destroy

    respond_to do |format|
      format.html { redirect_to(legislations_url) }
      format.xml  { head :ok }
    end
  end
end
