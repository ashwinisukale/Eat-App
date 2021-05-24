# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      ## User role e.g. admin, guest, manager
      t.string :role
      t.integer :restaurant_id

      t.timestamps
    end
  end
end