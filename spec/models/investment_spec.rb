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
require 'rails_helper'

RSpec.describe Investment do
  let(:investment) { create(:investment) }

  subject { investment }
  describe 'validations' do
    it { is_expected.to be_valid }
  end
end
