class FontsController < ApplicationController

  def index
    @fonts = Font.all
  end

  def show
    @font = Font.find(params[:id])
    @fonts_json = Font.to_json
    @languages_json = Language.to_json
    # handle client side
    # @language =  params['language'] || 'java'
  end

  def new
    @font = Font.new
  end

  def edit
    @font = Font.find(params[:id])
  end

  def create
    @font = Font.new(params[:font])
    if @font.save
      redirect_to Font, notice: 'Font was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @font = Font.find(params[:id])
    if @font.update_attributes(params[:font])
      redirect_to Font, notice: 'Font was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @font = Font.find(params[:id])
    @font.destroy
    redirect_to Font
  end
end
