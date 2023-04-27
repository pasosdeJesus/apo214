# frozen_string_literal: true

module Apo214
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # No define control de acceso por ser utilidad
  end
end
