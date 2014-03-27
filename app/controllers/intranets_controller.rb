class IntranetsController < ApplicationController
  before_action :set_intranet, only: [:show, :edit, :update, :destroy]

  # GET /intranets
  # GET /intranets.json
  def index
    @intranets = Intranet.all
  end

  # GET /intranets/1
  # GET /intranets/1.json
  def show
  end

  # GET /intranets/new
  def new
    @intranet = Intranet.new
  end

  # GET /intranets/1/edit
  def edit
  end

  # POST /intranets
  # POST /intranets.json
  def create
    @intranet = Intranet.new(intranet_params)

    respond_to do |format|
      if @intranet.save
        format.html { redirect_to @intranet, notice: 'Intranet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @intranet }
      else
        format.html { render action: 'new' }
        format.json { render json: @intranet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intranets/1
  # PATCH/PUT /intranets/1.json
  def update
    respond_to do |format|
      if @intranet.update(intranet_params)
        format.html { redirect_to @intranet, notice: 'Intranet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @intranet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intranets/1
  # DELETE /intranets/1.json
  def destroy
    @intranet.destroy
    respond_to do |format|
      format.html { redirect_to intranets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intranet
      @intranet = Intranet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intranet_params
      params.require(:intranet).permit(:category_name, :show, :start_time, :start_time_text, :finish_time)
    end
end
