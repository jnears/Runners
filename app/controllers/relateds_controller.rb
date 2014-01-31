class RelatedsController < ApplicationController
  before_action :set_related, only: [:show, :edit, :update, :destroy]

  # GET /relateds
  # GET /relateds.json
  def index
    @relateds = Related.all
  end

  # GET /relateds/1
  # GET /relateds/1.json
  def show
  end

  # GET /relateds/new
  def new
    @related = Related.new
  end

  # GET /relateds/1/edit
  def edit
  end

  # POST /relateds
  # POST /relateds.json
  def create
    @related = Related.new(related_params)

    respond_to do |format|
      if @related.save
        format.html { redirect_to @related, notice: 'Related was successfully created.' }
        format.json { render action: 'show', status: :created, location: @related }
      else
        format.html { render action: 'new' }
        format.json { render json: @related.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relateds/1
  # PATCH/PUT /relateds/1.json
  def update
    respond_to do |format|
      if @related.update(related_params)
        format.html { redirect_to @related, notice: 'Related was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @related.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relateds/1
  # DELETE /relateds/1.json
  def destroy
    @related.destroy
    respond_to do |format|
      format.html { redirect_to relateds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_related
      @related = Related.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def related_params
      params.require(:related).permit(:weburl)
    end
end
