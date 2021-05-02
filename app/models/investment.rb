# frozen_string_literal: true

class Investment < ApplicationRecord
  belongs_to :user
  enum kind: { cheque: 0, other: 1 }
  enum coin: { peso: 0, dolar: 1 }

  validates :name,
            :kind,
            :start_date,
            :initial_value,
            :coin,
            presence: true
end
