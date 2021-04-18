module Api
  class EventsController < ApplicationController
    def index
      render json: Event.joins(:user).all.map { |events|
        {
          id: events.id,
          title: events.title,
          name: events.name,
          createAt: events.created_at,
          createBy: events.user.username
        }
      }
    end

    def create
      event = Event.create(
        title: params[:title],
        name: params[:name],
        user_id: params[:user_id]
      )
      event_valid = event.valid?
      if event_valid
        render json: { message: 'Successfully create an event' }, status: 200
      else
        render json: { message: 'unable to create event' }, status: 400
      end
    end

    def show
      puts params[:id]
      render json: Event.find(params[:id])
    end

    def update
      event = Event.find(params[:id])
      event.update(
        title: params[:title],
        name: params[:name],
      )
      render json: { message: 'Successfully updated event' }, status: 200
    end

    def destroy
      event = Event.find(params[:id])
      event.destroy
      render json: { message: 'Event deleted successfully' }, status: 200
    end

  end
end

