class BucketsController < ApplicationController
  
  def index
    if params[:only]
      @buckets = Bucket.find(:all, :conditions => {:id => params[:only].split(',')})
    else
      @buckets = Bucket.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buckets }
      format.js do
        response.headers["Content-Type"] = 'text/javascript'
        render :js => "[#{@buckets.map {|b| b.to_json}.join(',')}]"
      end
    end
  end

  def show
    @bucket = Bucket.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @bucket }
      format.js { render :js => @bucket.to_json}
    end
  end

  def new
    @bucket = Bucket.new

    respond_to do |format|
      format.html { render :action => (params[:ui] == 'ajax' ? 'ajax_new' : 'new')}
      format.xml  { render :xml => @bucket }
    end
  end

  def edit
    @bucket = Bucket.find(params[:id])
  end

  def create
    @bucket = Bucket.new(params[:bucket])

    respond_to do |format|
      if @bucket.save
        flash[:notice] = t('bucket.flash.created')
        format.html { redirect_to buckets_path }
        format.xml  { render :xml => @bucket, :status => :created, :location => @bucket }
        format.js do
          # fuck IE!!
          response.headers["Content-Type"] = 'text/html'
          render :js => @bucket.to_json
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bucket.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @bucket = Bucket.find(params[:id])

    respond_to do |format|
      if @bucket.update_attributes(params[:bucket])
        flash[:notice] = t('bucket.flash.updated')
        format.html { redirect_to buckets_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bucket.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @bucket = Bucket.find(params[:id])
    @bucket.destroy

    respond_to do |format|
      format.html { redirect_to(buckets_url) }
      format.xml  { head :ok }
      format.js { render :js => "true"}
    end
  end
end
