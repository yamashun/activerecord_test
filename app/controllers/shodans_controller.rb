class ShodansController < ApplicationController
  before_action :set_shodan, only: [:show, :edit, :update, :destroy]

  # GET /shodans
  # GET /shodans.json
  def index
    @shodans = Shodan.all
  end

  # GET /shodans/1
  # GET /shodans/1.json
  def show
  end

  # GET /shodans/new
  def new
    @shodan = Shodan.new
  end

  # GET /shodans/1/edit
  def edit
  end

  # POST /shodans
  # POST /shodans.json
  def create
    @shodan = Shodan.new(shodan_params)

    respond_to do |format|
      if @shodan.save
        format.html { redirect_to @shodan, notice: 'Shodan was successfully created.' }
        format.json { render :show, status: :created, location: @shodan }
      else
        format.html { render :new }
        format.json { render json: @shodan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shodans/1
  # PATCH/PUT /shodans/1.json
  def update
    respond_to do |format|
      if @shodan.update(shodan_params)
        format.html { redirect_to @shodan, notice: 'Shodan was successfully updated.' }
        format.json { render :show, status: :ok, location: @shodan }
      else
        format.html { render :edit }
        format.json { render json: @shodan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shodans/1
  # DELETE /shodans/1.json
  def destroy
    @shodan.destroy
    respond_to do |format|
      format.html { redirect_to shodans_url, notice: 'Shodan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shodan
      @shodan = Shodan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shodan_params
      params.require(:shodan).permit(:bb_number, :first_name, :last_name, :status)
    end
end
