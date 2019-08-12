class StaticPagesController < ApplicationController
  def welcome
    @posts = Post.all
  end
end
