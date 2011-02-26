class SeancesController < ApplicationController
  # GET /seances
  # GET /seances.xml
  def index
    @seances = Seance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @seances }
    end
  end

  # GET /seances/1
  # GET /seances/1.xml
  def show
    @seance = Seance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seance }
    end
  end

  # GET /seances/new
  # GET /seances/new.xml
  def new
    @seance = Seance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seance }
    end
  end

  # GET /seances/1/edit
  def edit
    @seance = Seance.find(params[:id])
  end

  # POST /seances
  # POST /seances.xml
  def create
    @seance = Seance.new(params[:seance])

    respond_to do |format|
      if @seance.save
        format.html { redirect_to(@seance, :notice => 'Seance was successfully created.') }
        format.xml  { render :xml => @seance, :status => :created, :location => @seance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @seance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /seances/1
  # PUT /seances/1.xml
  def update
    @seance = Seance.find(params[:id])

    respond_to do |format|
      if @seance.update_attributes(params[:seance])
        format.html { redirect_to(@seance, :notice => 'Seance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /seances/1
  # DELETE /seances/1.xml
  def destroy
    @seance = Seance.find(params[:id])
    @seance.destroy

    respond_to do |format|
      format.html { redirect_to(seances_url) }
      format.xml  { head :ok }
    end
  end
end
