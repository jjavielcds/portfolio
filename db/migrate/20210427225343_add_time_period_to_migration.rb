# frozen_string_literal: true

class AddTimePeriodToMigration < ActiveRecord::Migration[6.1]
  def change
    change_table :investments do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :initial_value, precision: 10, scale: 5
      t.decimal :final_value, precision: 10, scale: 5
      t.integer :coin
    end
  end
end
