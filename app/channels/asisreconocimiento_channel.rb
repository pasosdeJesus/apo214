# frozen_string_literal: true

class AsisreconocimientoChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.info("Subscribed to #{params[:asisreconocimiento_id]}")

    stream_from("AsisreconocimientoChannel:#{params[:asisreconocimiento_id]}")
  end

  def unsubscribed
    stop_all_streams
  end
end
