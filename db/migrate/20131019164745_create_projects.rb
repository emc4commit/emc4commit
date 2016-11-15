class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :url
      t.string :emercoin_address

      t.timestamps
    end
  end
end
