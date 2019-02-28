class Organizer::EventsController < Organizer::BaseController
  before_action :set_event, except: %i(myevents index new create)

  def new
    @event = Event.new
    @event.build_place
  end

  def show
    @posts = @event.posts.page(params[:page]).per(Settings.per_paginate_posts_event)
  end

  def index
    @events = Event.event_index.order_desc.page params[:page]
    @event_new = @events.limit Settings.limit_event_new
  end

  def myevents
    @events = Event.load_myevent(current_user.id).order_desc.page params[:page]
    render "myevents"
  end

  def create
    @event = Event.new event_params
    @event.create_by = current_user.id
    if @event.save
      @event.update_attribute(:place_id, @event.place.id)
      flash[:success] = t "success"
      render :show
    else
      render :new
    end
  end

  def update
    if @event.update_attributes event_params
      flash[:success] = t "success"
      redirect_to organizer_event_path
    else
      render :edit
    end
  end

  def destroy
    respond_to do |format|
      if @event.destroy
        format.js {flash[:success] = t("success")}
        format.html {flash[:success] = t("success")}
      else
        format.js
        format.html {flash[:danger] = t("error")}
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_date, :end_date, :description, :banner,
      place_attributes: [:latitude, :longitude, :address])
  end

  def set_event
    @event = Event.find_by id: params[:id]
    return if @event
    flash[:danger] = t "not_found_event"
    redirect_to organizer_events_path
  end
end
