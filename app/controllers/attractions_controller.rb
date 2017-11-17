class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def new
    if current_user.admin == true
      @attraction = Attraction.new
    else
      flash[:alert] = "Only admins are allowed to create new attractions."
      redirect_to attractions_path
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.admin? == false
      flash[:alert] = "Only admins are allowed to edit attractions."
      redirect_to attraction_path(@attraction)
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
