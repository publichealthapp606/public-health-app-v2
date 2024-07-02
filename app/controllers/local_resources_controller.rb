class LocalResourcesController < ApplicationController
  before_action :set_local_resource, only: %i[ show edit update destroy ]

  # GET /local_resources or /local_resources.json
  def index
    @local_resources = LocalResource.all
  end

  # GET /local_resources/1 or /local_resources/1.json
  def show
  end

  # GET /local_resources/new
  def new
    @local_resource = LocalResource.new
  end

  # GET /local_resources/1/edit
  def edit
  end

  # POST /local_resources or /local_resources.json
  def create
    @local_resource = LocalResource.new(local_resource_params)

    respond_to do |format|
      if @local_resource.save
        format.html { redirect_to local_resource_url(@local_resource), notice: "Local resource was successfully created." }
        format.json { render :show, status: :created, location: @local_resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @local_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_resources/1 or /local_resources/1.json
  def update
    respond_to do |format|
      if @local_resource.update(local_resource_params)
        format.html { redirect_to local_resource_url(@local_resource), notice: "Local resource was successfully updated." }
        format.json { render :show, status: :ok, location: @local_resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @local_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_resources/1 or /local_resources/1.json
  def destroy
    @local_resource.destroy

    respond_to do |format|
      format.html { redirect_to local_resources_url, notice: "Local resource was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_resource
      debugger
      @local_resource = LocalResource.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def local_resource_params
      params.require(:local_resource).permit(:name, :zip, :website, :address, :phone_number, :email, :is_partner)
    end
end
