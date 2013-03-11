class ListsController < ApplicationController
  # GET /lists
  # GET /lists.json
  def index    
    @lists = List.all
  end

  # GET /lists/new
  def new
  	@list = List.new
  	respond_to do |format|
  		format.html
  		format.json { render json: @list }
  	end
  end

  # POST /lists
  def create
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_url, notice: 'List was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /lists/:id
  def show
    @list = List.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /posts/:id/edit
  def edit
    @list = List.find(params[:id])
  end

  #
  def update
  	@list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :ok }
    end
  end

end