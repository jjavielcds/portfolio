# frozen_string_literal: true

class CreateInvestmentTable < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.string :name
      t.decimal :tir, precision: 10, scale: 5
      t.integer :kind, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
