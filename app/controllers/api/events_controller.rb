# frozen_string_literal: true

class Api::EventsController < ApplicationController
  before_action :user_exists, except: [:index]

  def index
    render json: Event.joins(:user).all.map { |events|
      {
        id: events.id,
        title: events.title,
        name: events.name,
        createBy: events.user.username,
        eventDate: events.eventdate
      }
    }
  end

  def create
    event = Event.create(
      title: params[:title],
      name: params[:name],
      user_id: params[:loginUser_id],
      eventdate: params[:eventDate]
    )
    if event.valid?
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
    if event.user_id === params[:loginUser_id]
      event.update(
        title: params[:title],
        name: params[:name],
        eventdate: params[:eventDate]
      )
      render json: { message: 'Successfully updated event' }, status: 200
    else
      render json: { message: 'Unauthorised author, unable to update event' }, status: 403
    end

  end

  def destroy
    event = Event.find(params[:id])
    if event.user_id === params[:loginUser_id]
      event.destroy
      render json: { message: 'Event deleted successfully' }, status: 200
    else
      render json: { message: 'unable to delete event' }, status: 403
    end
  end
end


