class EventsController < ApplicationController
  before_action :set_event, only:[:show,:edit,:update,:destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :show,:destroy]
  before_action :require_login_current,only:[:edit,:destroy]

  def index
    @events = Event.all
    @index_title = "イベント一覧"
    @q = Event.ransack(params[:q])
    @events = @q.result.page(params[:page]).per(8)
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
    @participation = current_user.participations.find_by(event_id: @event.id)
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

  def list
    if params[:id] == "join"
      joins = Participation.where(user_id: current_user.id)
      @events = Array.new
      joins.each do |join|
        @events << join.event
      end
      @events = @events.page(params[:page]).per(8)
      @index_title = "参加するイベント"

    elsif params[:id] == "own"
      @events = Event.where(user_id: current_user.id).page(params[:page]).per(8)
      @index_title = "企画したイベント"

    elsif params[:id] == "favorite"
      favorites = Favorite.where(user_id: current_user.id)
      @events = Array.new
      favorites.each do |favorite|
        @events << favorite.event
      end
      @index_title = "お気に入りしたイベント"
    else
      redirect_to events_path
      @index_title = "イベント一覧"
    end
    render :index
  end


  private

  def event_params
    params.require(:event).permit(:title,:time,:place,:capacity,:content,:username,:image,:image_cache)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def require_login_current
    unless current_user.id == @event.user_id
      redirect_to events_path,notice:"その他のユーザーです"
    end
  end

  def user_params
    params.require(:user).permit(:image,:image_cache)
  end
end
