class CreateGrabs < ActiveRecord::Migration
  def change
    create_table :grabs do |t|

      t.timestamps
    end
  end
end
