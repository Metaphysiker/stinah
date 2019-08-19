class StaticPagesController < ApplicationController
  def welcome
    @posts = Post.all.order("created_at").reverse_order.first(3)
  end

  def newhome

  end

  def about

  end

  def animalsofstinah

  end

  def faq

  end

  def contact

  end
end
