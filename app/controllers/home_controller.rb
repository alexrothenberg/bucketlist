class HomeController < ApplicationController
  def index
    @due_date_in_millis = Time.parse('Sep 2, 2014').to_i * 1000
  end
end
