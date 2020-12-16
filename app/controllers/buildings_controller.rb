class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]


  def index
    @buildings = Building.all
  end

  def show
  end


  def new
    @building = Building.new
    2.times { @building.stations.build }
  end


  def edit
    1.times { @building.stations.build }
  end


  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
end


  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_building
      @building = Building.find(params[:id])
    end


    def building_params
      params.require(:building).permit(:building, :rent, :address, :feedbacks, :building_age, :remarks, stations_attributes: [ :id,
                                                                                                                  :station_name,
                                                                                                                  :rail_way_line,                                                                                                              :station_name,
                                                                                                              :minutes_walk ])
    end
end
