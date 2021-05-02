# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    @user = ::UserPresenter.new(current_user)
  end
end
