
ENV['RAILS_ENV'] ||= 'test'

require 'nokogiri'
require 'simplecov'
SimpleCov.start 'rails'
require_relative 'dummy/config/environment'
require 'rails/test_help'
require 'rake'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
Dummy::Application.load_tasks # providing your application name is 'sample'

class ActiveSupport::TestCase
  #fixtures :all

  if Sip::Tclase.all.count == 0
    load "#{Rails.root}/db/seeds.rb"
    #Rake::Task[].reenable # in case you're going to invoke the same task second time.
    Rake::Task['sip:indices'].invoke
  end

  protected
  def load_seeds
    load "#{Rails.root}/db/seeds.rb"
  end
end

