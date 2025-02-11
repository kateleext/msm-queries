class MovieController < ApplicationController
  def index
    @list_of_movies = Movie.all.order({:year => :desc, :title => :asc})
    render(:template => "index/movies")
  end

  def details
    movie_id = params.fetch("id")
    @movie = Movie.all.where(:id => movie_id).first
    director_id = @movie.director_id
    @director_name = Director.all.where(:id => @movie.director_id).first.name
    render(:template => "details/movie_details")
  end
end
