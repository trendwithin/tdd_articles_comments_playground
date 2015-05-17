class ArticlesController < ApplicationController
  def index
    @article = Articles.all
  end
end
