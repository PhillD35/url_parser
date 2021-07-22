# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :status, null: false, default: 'pending'

      t.timestamps
    end

    add_index :links, :url, unique: true
  end
end
