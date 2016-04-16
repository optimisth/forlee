class WelcomeController < ApplicationController
  layout 'welcome'

  def index
  end

  def choose
  end

  def about
    @about = About.order('created_at DESC').first
  end
end
