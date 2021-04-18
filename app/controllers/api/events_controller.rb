class EventsController < ApplicationController
  def index
    render json: Event.joins(:user).all.map{|events|




    }
  end

end
