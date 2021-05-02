# frozen_string_literal: true

# == Schema Information
#
# Table name: investments
#
#  id            :integer          not null, primary key
#  name          :string
#  tir           :decimal(10, 5)
#  kind          :integer          not null
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  start_date    :date
#  end_date      :date
#  initial_value :decimal(10, 5)
#  final_value   :decimal(10, 5)
#  coin          :integer
#
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

  private
  
  def set_tir
  end
end
