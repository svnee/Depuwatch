class DeputiesController < ApplicationController

  # GET /deputies
  # GET /deputies.xml
  def index
    @deputies = Deputy.all(:order => "lastname ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deputies }
    end
  end

  # GET /deputies/1
  # GET /deputies/1.xml
  def show
    @deputy = Deputy.find(params[:id], :include => :votes)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deputy }
    end
  end

  # GET /deputies/new
  # GET /deputies/new.xml
  def new
    @deputy = Deputy.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deputy }
    end
  end

  # GET /deputies/1/edit
  def edit
    @deputy = Deputy.find(params[:id])
  end

  # POST /deputies
  # POST /deputies.xml
  def create
    @deputy = Deputy.new(params[:deputy])
    
    respond_to do |format|
      if @deputy.save
        format.html { redirect_to(@deputy, :notice => 'Deputy was successfully created.') }
        format.xml  { render :xml => @deputy, :status => :created, :location => @deputy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deputy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deputies/1
  # PUT /deputies/1.xml
  def update
    @deputy = Deputy.find(params[:id])
		expire_fragment("deputies_show_#{@deputy.id}")
    respond_to do |format|
      if @deputy.update_attributes(params[:deputy])
        format.html { redirect_to(@deputy, :notice => 'Deputy was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deputy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deputies/1
  # DELETE /deputies/1.xml
  def destroy
    @deputy = Deputy.find(params[:id])
    @deputy.destroy

    respond_to do |format|
      format.html { redirect_to(deputies_url) }
      format.xml  { head :ok }
    end
  end
end
