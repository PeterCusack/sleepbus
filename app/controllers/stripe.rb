post "/stripe/charge" do
  customer = Stripe::Customer.create(
    :email => params["stripeEmail"],
    :card  => params[:stripeToken]
  )
  # checkout to makesure number of tickets available for that trip < told sold + amount about to sell
  # then create charge, else sold out
  charge = Stripe::Charge.create(
    :amount      => (params["cost"].to_i / 100), #everything should be handled in cents up to this point
    :description => 'Bus ticket Charge',
    :currency    => 'usd',
    :customer    => customer.id
  )

  #  if charge successful
    # passengerIDs.forEach |id| do
    #   Ticket.create({
    #     passenger_id:.id,
    #     trip_id: params["trip_id"].to_i
    #    })
    # end
  # end

  # once javascript start preventDefault() uncomment next three lines
  # confirmPage = erb :payment_success
  # content_type :json
  # return confirmPage.to_json
  erb :payment_success, :layout => false
end