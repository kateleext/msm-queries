class DirectorController < ApplicationController
  def index
    @list_of_directors = Director.all.order({:dob => :asc})
    render(:template => "index/directors")
  end

  def details
    director_id = params.fetch("id")
    @director = Director.all.where(:id => director_id).first
    @filmography = Movie.all.where(:director_id => director_id)
    render(:template => "details/director_details")
  end

  def eldest
    eldest = Director.all.where.not(:dob=>nil).order({:dob => :asc}).first
    @id = eldest.id
    @name = eldest.name
    @dob = eldest.dob.strftime("%B %d, %Y")
    render(:template => "details/eldest_director")
  end

  def youngest
    youngest = Director.all.where.not(:dob=>nil).order({:dob => :desc}).first
    @id = youngest.id
    @name = youngest.name
    @dob = youngest.dob.strftime("%B %d, %Y")
    render(:template => "details/youngest_director")
  end
end
