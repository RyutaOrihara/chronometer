class EventsController < ApplicationController
  before_action :set_event, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :show,:destroy]
  before_action :require_login_current,only:[:edit]

  def index
    @events = Event.all
  end

  def new
    if params[:back]
      @event = Event.new(event_params)
    else
      @event = Event.new
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path, notice:"イベントを作成しました"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(event_id: @event.id)
  end

  def edit

  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice:"イベントを編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice:"イベントを削除しました"
  end

  def confirm
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    render :new if @event.invalid?
  end

  private

  def event_params
    params.require(:event).permit(:title,:time,:place,:capacity,:content,:username)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def require_login_current
    unless current_user.id == @event.user_id
      redirect_to events_path,notice:"その他のユーザーです"
    end
  end
end
