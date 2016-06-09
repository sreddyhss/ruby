class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :company
      t.string :email
      t.integer :mobile
      t.string :website

      t.timestamps null: false
    end
  end
end
