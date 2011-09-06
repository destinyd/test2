class UserhomesController < ApplicationController
  before_filter :authenticate_user!,:except =>[:index,:show]
  def index
  end

  def integrals
    @integrals=current_user.integrals
    @integrals_count = @integrals.sum(:point)
  end
end
