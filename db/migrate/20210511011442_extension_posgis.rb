# frozen_string_literal: true

class ExtensionPosgis < ActiveRecord::Migration[6.1]
  def up
    execute(<<-SQL)
      CREATE EXTENSION IF NOT EXISTS postgis;
    SQL
  end
end
