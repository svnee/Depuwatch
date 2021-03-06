class TextsController < ApplicationController

  # GET /texts
  # GET /texts.xml
  def index
    @texts = Text.all
    @top = Text.where('favorite < 99').order(:favorite)
    @featured = Text.where('featured <> ""').order(:updated_at)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @texts }
    end
  end

  # GET /texts/1
  # GET /texts/1.xml
  def show
    @text = Text.find(params[:id])
    @text.votes.sort!{|a,b| a.deputy.party_id <=> b.deputy.party_id}
    @rating = Rating.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @text }
    end
  end

  # GET /texts/new
  # GET /texts/new.xml
  def new
    @text = Text.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @text }
    end
  end

  # GET /texts/1/edit
  def edit
    @text = Text.find(params[:id])
    @text.code.gsub!(/<.*?>/, '')
  end

  # POST /texts
  # POST /texts.xml
  def create
    @text = Text.new(params[:text])
    @text.favorite = 99
		expire_fragment("texts_index_tab1")
    respond_to do |format|
      if @text.save
        format.html { redirect_to(@text, :notice => 'Text was successfully created.') }
        format.xml  { render :xml => @text, :status => :created, :location => @text }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /texts/1
  # PUT /texts/1.xml
  def update
    @text = Text.find(params[:id])
		expire_fragment("texts_index_tab1")
		expire_fragment("texts_show_#{@text.id}")
		params[:text][:code].gsub!(/<.*?>/, '')
    respond_to do |format|
      if @text.update_attributes(params[:text])
        format.html { redirect_to(@text, :notice => 'Text was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @text.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.xml
  def destroy
    @text = Text.find(params[:id])
    @text.destroy
		expire_fragment("texts_index_tab1")
		expire_fragment("texts_show_#{@text.id}")
    respond_to do |format|
      format.html { redirect_to(texts_url) }
      format.xml  { head :ok }
    end
  end
end
