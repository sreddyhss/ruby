class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.Date :start_date
      t.string :status
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
