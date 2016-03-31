post "/passengers" do
	passengers = []
	params["passengersInfo"].each_key do |key|
		passenger = Passenger.create({
			first_name: params["passengersInfo"][key]["0"]["value"],
			last_name: params["passengersInfo"][key]["1"]["value"],
			email: params["passengersInfo"][key]["2"]["value"]
			})
		if passenger.save
			passengers.push({
				id: passenger.id,
				first_name: passenger.first_name,
				last_name: passenger.last_name,
				email: passenger.email}
			)
		else
			# return error message of some kind
		end
			# do something because we didn't save the passenger
		# Ticket.create({
		# 	passenger_id: passenger.id,
		# 	trip_id: params["trip_id"].to_i
		# 	})
	end
	content_type :json
	checkoutTemplate = erb :stripe_payment, layout: false, locals: {cost: (6500 * passengers.length), passengers: passengers}
	return checkoutTemplate.to_json
end

#{"0_passenger"=>{"0"=>{"name"=>"0_first_name", "value"=>"Shayanne"}, "1"=>{"name"=>"0_last_name", "value"=>"Wright"}, "2"=>{"name"=>"0_email", "value"=>"shayannewright@gmail.com"}}}