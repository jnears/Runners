class RunnersController < ApplicationController
  before_action :set_runner, only: [:show_lastname, :show, :edit, :update, :destroy]

  # GET /runners
  # GET /runners.json
  def index #mapped as a GET request to the index.html.erb file
    @runners = Runner.all #retrieve all records from the Runners model assign them to the instance variable @runners

    #RETRIEVES AN ARRAY

    #<ActiveRecord::Relation [#<Runner id: 1, firstname: "Pete", lastname: "West", created_at: "2013-09-11 10:54:03", updated_at: "2013-09-11 12:53:03">, #<Runner id: 2, firstname: "Jon", lastname: "Nears", created_at: "2013-09-11 12:51:37", updated_at: "2013-09-11 12:51:37">, #<Runner id: 3, firstname: "sdsdsd", lastname: "sds", created_at: "2013-09-13 11:32:51", updated_at: "2013-09-13 11:32:51">, #<Runner id: 4, firstname: "Bug", lastname: "Bunny", created_at: "2013-09-18 12:44:46", updated_at: "2013-09-18 12:44:46">, #<Runner id: 5, firstname: "asd", lastname: "da", created_at: "2013-09-18 12:51:09", updated_at: "2013-09-18 12:51:09">, #<Runner id: 6, firstname: "sad", lastname: "asd", created_at: "2013-09-18 12:51:53", updated_at: "2013-09-18 12:51:53">, #<Runner id: 7, firstname: "sada", lastname: "ad", created_at: "2013-09-18 12:54:25", updated_at: "2013-09-18 12:54:25">, #<Runner id: 8, firstname: "Adrian", lastname: "Mussett", created_at: "2013-09-18 13:07:12", updated_at: "2013-09-18 13:07:12">]>

  end

  # GET /runners/1
  # GET /runners/1.json


  def show
    # RETRIEVES KEY/VALUE PAIRS
    # <Runner id: 1, firstname: "Pete", lastname: "West", created_at: "2013-09-11 10:54:03", updated_at: "2013-09-11 12:53:03">
  end


  def top_three
   # @runners = Runner.find(:all, :order => "created_at desc", :limit => 3)
    @runners = Runner.order(created_at: :desc).take(3)
    @runner_count = @runners.count
    #all is a retrieval of find method that returns all records matched by the options
  end

 # GET /runners/1/show_lastname
  def show_lastname
  end


  # GET /runners/new
  def new
    @runner = Runner.new #make avaialable to the view @runner instance variable
   # @runner.build_address
    @runner.shoes.build
    

    # initializes a new runner with all the fields set to blank (unless specified a default in your migration).  This account has not been save to the db yet.  It is ready for a user to fill in.

    # <Runner id: nil, firstname: nil, lastname: nil, created_at: nil, updated_at: nil>

    # nil are objects 
  end

  # GET /runners/1/edit
  def edit #sets the forms post action to the 
  # when form is created is includes a hidden method field to reflect patch <input name="_method" type="hidden" value="patch">
  if @runner.shoes.empty?
  @runner.shoes.build
end
  end

  # POST /runners
  # POST /runners.json
  def create
    @runner = Runner.new(runner_params)

    respond_to do |format|
      # Rails can automatically respond differently to different client request.  If a client i.e browser wants HTML rails responds with HTML.
      if @runner.save                    
       # If the validations pass and the runner gets saved redirect to the show page of the new record, otherwise refresh/render the new page (hopefully showing what error caused the record to fail to save).

        format.html { redirect_to @runner, notice: 'Runner was successfully created.' } 
        # Call redirect_to to send an HTTP redirect status code to the browser
        format.json { render action: 'show', status: :created, location: @runner }
      else
         # render creates a full response to send back to the browser
        format.html { render action: 'new' } #server sends information back to the client browser uses the action new (which show the new view)
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runners/1
  # PATCH/PUT /runners/1.json
  def update
    respond_to do |format|
      if @runner.update(runner_params) #dont need to call new as object already exists
        format.html { redirect_to @runner, notice: 'Runner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @runner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.json
  def destroy
    @runner.destroy
     # destroy is a more thourough delete and will check the options of this records associations and destroy the associated objects as well if they are dependant on this object. 

    respond_to do |format|
      format.html { redirect_to runners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runner
      @runner = Runner.find(params[:id]) #find is a method of activecontroller 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runner_params
        params.require(:runner).permit(:id, :firstname, :lastname, :age, :gender, shoes_attributes: [:id, :runner_id, :shoe_id, :size, :make, :shoe_type] )#address_attributes: [:runner_id, :city], runners_shoes_attributes: [:runner_id, :shoe_id])
    end
end
