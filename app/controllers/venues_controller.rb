class VenuesController < ApplicationController

  def venue_list
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at => :desc)
    render({ :template => "venue_templates/venue_list.html.erb" })
  end

  def details
    venue_id = params.fetch("an_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details.html.erb" })
  end

  def create
    
    input_address = params.fetch("query_address")
    input_name = params.fetch("query_name")
    input_neighborhood = params.fetch("query_neighborhood")

    new_venue = Venue.new
    
    new_venue.address = input_address
    new_venue.name = input_name
    new_venue.neighborhood = input_neighborhood

    new_venue.save

    redirect_to("/venues/" + new_venue.id.to_s )
  end

  
  def update
    the_id = params.fetch("the_id")

    matching_venues = Venue.where({ :id => the_id })

    the_venue = matching_venues.at(0)

    input_address = params.fetch("query_address")
    input_name = params.fetch("query_name")
    input_neighborhood = params.fetch("query_neighborhood")

    the_venue.address = input_address
    the_venue.name = input_name
    the_venue.neighborhood = input_neighborhood
    the_venue.save
    
    redirect_to("/venues/" + the_venue.id.to_s)
  end

  def destroy
    the_id = params.fetch("id_to_delete")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues.at(0)
    venue.destroy

    redirect_to("/venues")
  end

end
