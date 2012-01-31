class FontsController < ApplicationController
  # GET /fonts
  # GET /fonts.json
  def index
    @fonts = Font.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fonts }
    end
  end

  # GET /fonts/1
  # GET /fonts/1.json
  def show
    @font = Font.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @font }
    end
  end

  # GET /fonts/new
  # GET /fonts/new.json
  def new
    @font = Font.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @font }
    end
  end

  # GET /fonts/1/edit
  def edit
    @font = Font.find(params[:id])
  end

  # POST /fonts
  # POST /fonts.json
  def create
    @font = Font.new(params[:font])

    respond_to do |format|
      if @font.save
        format.html { redirect_to @font, notice: 'Font was successfully created.' }
        format.json { render json: @font, status: :created, location: @font }
      else
        format.html { render action: "new" }
        format.json { render json: @font.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fonts/1
  # PUT /fonts/1.json
  def update
    @font = Font.find(params[:id])

    respond_to do |format|
      if @font.update_attributes(params[:font])
        format.html { redirect_to @font, notice: 'Font was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @font.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fonts/1
  # DELETE /fonts/1.json
  def destroy
    @font = Font.find(params[:id])
    @font.destroy

    respond_to do |format|
      format.html { redirect_to fonts_url }
      format.json { head :no_content }
    end
  end
end
