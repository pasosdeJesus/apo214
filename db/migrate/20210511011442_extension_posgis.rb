class ExtensionPosgis < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE EXTENSION postgis;
    SQL
  end
end
