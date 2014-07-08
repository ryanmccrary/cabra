class TripTypesController < ApplicationController 
  def index
    @trip_types = Trip_type.all
  end
end