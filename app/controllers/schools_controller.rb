class SchoolsController < ApplicationController

  def index
    @schools = School.all
    render :json => @schools
  end

  def show
    @school = School.find(params[:id])
    @posts = @school.posts
    render :json => {school: @school, posts: @posts}
  end

  def create
    @school = School.new(school_params)

    if @school.save
      render :json => @school
    end

  end

  private
    def school_params
      params.require(:school).permit(:name, :address, :lat, :lng)
    end

end
