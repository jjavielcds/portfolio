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
  before_save :set_tir, unless: :tir?
  before_save :set_final_value, unless: :final_value?

  validates :name,
            :kind,
            :start_date,
            :initial_value,
            :coin,
            presence: true

  private

  def set_final_value
    return if tir.blank? || end_date.blank?

    self.final_value = 2**(Math.log(tir / 100 + 1, 2) / (360 / (end_date - start_date)) + Math.log(initial_value, 2))
  end

  def set_tir
    return if final_value.blank? || end_date.blank?

    self.tir = (((final_value / initial_value)**(360 / (end_date - start_date))) - 1) * 100
  end
end
