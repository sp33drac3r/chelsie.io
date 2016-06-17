class CentersController < ApplicationController
  def index
    @centers = ServiceProvider.all
    render :json => @centers
  end

  def show
    @center = ServiceProvider.find(params[:id])
    render :json => @center
  end

  def services
    @center = ServiceProvider.find(params[:id])
    render :json => @center.services_offered
  end

  def populations
    @center = ServiceProvider.find(params[:id])
    render :json => @center.populations_served
  end

  def query
    p "%$#" * 30
    query = params[:query]
    query = Rack::Utils.parse_nested_query(params[:query])
    query.each{|sub_query| puts "#{sub_query[1]}"}
    p "%$#" * 30
    @center = ServiceProvider.where( )
  end

  def state
    @centers = ServiceProvider.where("address LIKE ?", "%#{params[:state_abbr]}%")
    render :json => @centers
  end

  def location
    @lattitude = params[:lat]
    @longitude = params[:lng]
    @radius   = params[:radius]

    location_query = <<-SQL
                    SELECT *,
                          69.0 * DEGREES(ACOS(COS(RADIANS(latpoint))
                               * COS(RADIANS(lat))
                               * COS(RADIANS(longpoint) - RADIANS(lng))
                               + SIN(RADIANS(latpoint))
                               * SIN(RADIANS(lat)))) AS distance_in_miles
                    FROM service_providers
                    JOIN (
                      SELECT #{@lattitude} AS latpoint,
                             #{@longitude} AS longpoint
                    ) AS p ON 1=1
                    WHERE lat IS NOT NULL AND lng IS NOT NULL
                    ORDER BY distance_in_miles
                    LIMIT 10;
                SQL

    location_result = ActiveRecord::Base.connection.exec_query(location_query)
    render json: location_result
  end

end
