class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]
  
  def landing_page
    @list_users = User.all
  end

  def dashboard
  end
end
