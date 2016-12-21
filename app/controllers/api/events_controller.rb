class Api::EventsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action do
    request.format = :json
  end

  def new
    @project = Project.find(params[:project_id])
    @event = @project.events.create(event_params)
  end

  def create
    @project = Project.find_by(params[:project_id])
    @event = @project.events.create(event_params)
      if @event.save
          redirect_to root_path, notice: "Event Added!"
      else render :new
      end
    end

  def index
    @project = Project.find(params[:project_id])
    @events = @project.events.all
  end

  def show
    @project = Project.find_by(params[:project_id])
    @event = @project.events.find_by id: params[:id]
  end

  def update
    @project = Project.find_by(params[:project_id])
   @event = @project.events.find_by id: params[:id]
   @event.headline = params[:event][:headline]
   @event.text = params[:event][:text]
   @event.year = params[:event][:year]
   @event.month = params[:event][:month]
   @event.day = params[:event][:day]
   @event.hour = params[:event][:hour]
   @event.minute = params[:event][:minute]
   @event.caption = params[:event][:caption]
   @event.credit = params[:event][:credit]
   @event.thumbnail = params[:event][:thumbnail]

     if @event.save
       render :show, status: 200 #created
     else
       render json: {errors: @event.errors}, status: 422 #error
     end
   end

 def delete
   @event = Event.find_by id: params[:id]
   @event.destroy
   render json: {ok: true}, status: 200
 end


def timeline
  @project = Project.find_by(params[:project_id])
  @events = @project.events.all
end

private

def event_params
  params.require(:event).permit(:caption, :credit, :year,:hour, :minute,  :day, :headline, :hour, :month, :text, :thumbnail, :url, :date,  :user_ids => [] )
end


end
