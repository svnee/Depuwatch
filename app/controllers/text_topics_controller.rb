class TextTopicsController < ApplicationController

  # GET /text_topics
  # GET /text_topics.xml
  def index
    @text_topics = TextTopic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @text_topics }
    end
  end

  # GET /text_topics/1
  # GET /text_topics/1.xml
  def show
    @text_topic = TextTopic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @text_topic }
    end
  end

  # GET /text_topics/new
  # GET /text_topics/new.xml
  def new
    @text_topic = TextTopic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @text_topic }
    end
  end

  # GET /text_topics/1/edit
  def edit
    @text_topic = TextTopic.find(params[:id])
  end

  # POST /text_topics
  # POST /text_topics.xml
  def create
    @text_topic = TextTopic.new(params[:text_topic])

    respond_to do |format|
      if @text_topic.save
        format.html { redirect_to(@text_topic, :notice => 'Text topic was successfully created.') }
        format.xml  { render :xml => @text_topic, :status => :created, :location => @text_topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @text_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /text_topics/1
  # PUT /text_topics/1.xml
  def update
    @text_topic = TextTopic.find(params[:id])

    respond_to do |format|
      if @text_topic.update_attributes(params[:text_topic])
        format.html { redirect_to(@text_topic, :notice => 'Text topic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @text_topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /text_topics/1
  # DELETE /text_topics/1.xml
  def destroy
    @text_topic = TextTopic.find(params[:id])
    @text_topic.destroy

    respond_to do |format|
      format.html { redirect_to(text_topics_url) }
      format.xml  { head :ok }
    end
  end
end
