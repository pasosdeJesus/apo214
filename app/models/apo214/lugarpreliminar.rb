# encoding: UTF-8

require 'apo214/concerns/models/lugarpreliminar'
module Apo214
  class Lugarpreliminar < ActiveRecord::Base
    include Apo214::Concerns::Models::Lugarpreliminar
  end
end
