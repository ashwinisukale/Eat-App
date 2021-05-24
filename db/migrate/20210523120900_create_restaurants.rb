# frozen_string_literal: true

class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisines
      t.string :phone
      t.string :email
      t.string :location
      t.string :open_hours

      t.timestamps
    end
  end
end
