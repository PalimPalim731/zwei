class StaticPagesController < ApplicationController
  before_action :writesomestuffbefore
  after_action :writesomestuffafter

  def home
  end

  def contact
  end
end
