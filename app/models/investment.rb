# frozen_string_literal: true

class Investment < ApplicationRecord
  belongs_to :user
  enum kind: { cheque: 0, other: 1 }
end
