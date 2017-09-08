class Api::GroupEventsController < ApplicationController
	before_action :check_date_format, only: [:create,:update]
	before_action :find_event, only: [:update,:destroy]


	def create
    event = GroupEvent.new(event_parms)
    if event.save
      render :json => {:status => :ok, :user => event}
    else
      render :json => {:status => :bad_request, :message =>  event.errors }
    end
	end


	def update
		if @event.update(event_parms)
      render :json => {:status => :ok, :user => @event}
    else
      render :json => {:status => :bad_request, :message =>  @event.errors }
    end
	end


	def destroy
		if @event.update_column(:is_deleted, true)
			render :json => {:status => :ok, :message => "Event deleted successfully."}
		else
			render :json => {:status => :bad_request, :message => @event.errors }
		end
	end


	private
	def event_parms
		params.permit(:name, :description, :start, :end,:published,:duration )
	end
	def find_event
		@event = GroupEvent.find_by_id params[:id]
		if @event.blank?
			render :json => {:status => :bad_request,:message => "Event with id =#{params[:id]} doesn’t exist."}
		end
	end
	def check_date_format
		if params[:start].present? and params[:start].match(/\d{4}\-\d{2}\-\d{2}/).blank?
      render :json => {:status => :bad_request,:message => "Please provide start Date in the following format: yyyy-mm-dd"}
    end
    if params[:end].present? and params[:end].match(/\d{4}\-\d{2}\-\d{2}/).blank?
      render :json => {:status => :bad_request,:message => "Please provide End Date in the following format: yyyy-mm-dd"}
    end
    if params[:duration].present? and params[:duration].match(!/\A\d+\z/).blank?
      render :json => {:status => :bad_request,:message => "Please provide Duration in number e.g 30, 60"}
    end
	end
end
