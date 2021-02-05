require 'apo214/concerns/models/archivokml'

module Apo214
  class Archivokml < ActiveRecord::Base
    include Apo214::Concerns::Models::Archivokml
  end
end
