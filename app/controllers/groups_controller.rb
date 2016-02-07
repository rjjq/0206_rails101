class GroupsController < ApplicationController
  def index
    flash[:notice] = "早安"
    flash[:alert] = "晚安"
  end
end
