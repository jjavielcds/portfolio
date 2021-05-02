class UserPresenter
  attr_accessor :user
  delegate_missing_to :user

  def initialize(user)
    @user = user
  end

  def investments_count(kind = nil)
    investments(kind).count
  end

  def tir_average(kind = nil)
    investments(kind).average(:tir)
  end

  def weighted_average(kind = nil)
    full_value = 0
    result = investments(kind).pluck(:tir, :initial_value).map do | tir, value |
      full_value += value
      tir/value
    end.sum * full_value
    result.round(2)
  end

  def investments(kind = nil)
    return user.investments if kind.nil?

    user.investments.where(kind: kind)
  end
end
  