class ActorController < ApplicationController
  def index
    @list_of_actors = Actor.all.order({:dob => :asc})
    render(:template => "index/actors")
  end

  def details
    actor_id = params.fetch("id")
    @actor = Actor.all.where(:id => actor_id).first
    movie_ids = []
    Character.all.where(:actor_id => actor_id).each do |character| movie_ids.push(character.movie_id) end
    @filmography = Movie.all.where(:id => movie_ids)
    render(:template => "details/actor_details")
  end
end
