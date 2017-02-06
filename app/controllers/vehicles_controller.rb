class VehiclesController < ApplicationController

  def new
    @vehicle = Vehicle.new
  end

  def index

  end


  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to @vehicle
    else
      render 'new'
    end
  end

  def show
    #Define array with last digits of the plate for each day
    matriz=[ [1, 2], [3, 4], [5, 6], [7, 8], [9, 0] ]
    #*************************************************
    #Display fields on screen
    @vehicle = Vehicle.find(params[:id])
    @title = @vehicle.plate_number[6,6]
    main_date = DateTime.parse(@vehicle.matriculation_date)
    @main_date_1 =main_date.strftime("The date is %d/%m/%y")
    @main_time = @vehicle.time.strftime("%H : %M")
    @main_day = main_date.strftime("%A")
    #***************************************
    #select day of week to find in the array
    day_week = main_date.strftime("%w")
    #****************************************
    # select the digits in the array
    position1=matriz[day_week.to_i-1][0]
    position2=matriz[day_week.to_i-1][1]
    #****************************************
    #Validates permissions
    if @title.to_i==position1 or @title.to_i==position2
      if (@vehicle.time.hour.between?(7,9) and @vehicle.time.min.between?(1,30)) or (@vehicle.time.hour.between?(16,19) and @vehicle.time.min.between?(1,30))
        @meesage_user="You can't drive"
      else
        @meesage_user="You can drive"
     end
    else
      @meesage_user="You can drive "
    end
    #*****************************************
  end



  private
  def vehicle_params
    params.require(:vehicle).permit(:plate_number, :matriculation_date, :time)
  end

end
