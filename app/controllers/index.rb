get "/" do
  # include an a list of trips with the number or seats still available
  # # and pass it to the frontend. [{tripid:
  #                                   busId:
  #                                   start:
  #                                   end:
  #                                   seats: (bus.seats - (Tickets.find(where trip_id = tripID)).length)
  #                                     ^ this is to subtract already sold seats
  #                                 }]
  # then on the front end you can somehow control which days are showing and only show days
  # that aren't sold out yet.
	erb :landing
end
