require 'chronic'

get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :event_new
end

post '/events/create' do
    @event = Event.new(title: params[:title], organizer_name: params[:organizer_name], organizer_email: params[:organizer_email], date: Chronic.parse(params[:date]))
	
  	if @event.save
  		redirect '/'
  	else
  		@flash_alert = "Could not create event! <br />" + @event.errors.full_messages.join("<br />") + "#{params[:date]}"
		erb :event_new
	end
end
