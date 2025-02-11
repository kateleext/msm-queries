class ActorController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render(:template => "index/actors")
  end

  def details
    actor_id = params.fetch("id")
    @actor = Actor.all.where(:id => actor_id).first
    @filmography = Character.all.where(:actor_id => actor_id)
    render(:template => "details/actor_details")
  end
end
