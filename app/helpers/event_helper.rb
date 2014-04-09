module EventHelper
  def add_event(user, trip, message)
    @event = Event.new()
    @event.user = user
    @event.trip = trip
    @event.message = message

    @event.save
  end

end
