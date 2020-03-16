class ParticipationsController < ApplicationController
  def create
    @participation = current_user.participations.create(event_id:params[:event_id])
    EventMailer.event_mail(@participation).deliver
    redirect_to events_url,notice:"#{@participation.event.user.username}のイベントに参加登録しました"
  end

  def destroy
    @participation = current_user.participations.find(params[:id]).destroy
    redirect_to events_url, notice:"#{@participation.event.user.username}のイベントをキャンセルしました"
  end
end
