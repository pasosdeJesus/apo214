# frozen_string_literal: true

class ApplicationController < Sivel2Gen::ApplicationController
  protect_from_forgery with: :exception
end
