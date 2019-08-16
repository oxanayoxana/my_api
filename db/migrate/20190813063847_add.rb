# frozen_string_literal: true

class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, default: 'user'
  end
end
