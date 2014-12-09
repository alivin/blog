class StaticPagesController < ApplicationController
  def home
    @articles = Article.limit(5)
  end

  def help
  end

  def contact
  end

  def feed
  end
end
