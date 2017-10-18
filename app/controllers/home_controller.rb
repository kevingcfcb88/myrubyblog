class HomeController < ApplicationController
  def index
    ActiveRecord::Base.establish_connection(
      :adapter  => "postgresql",
      :host     => "localhost",
      :username => "postgres",
      :password => "vagrant",
      :database => "myrubyblog"
    )
  end
end
