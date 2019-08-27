class StaticPagesController < ApplicationController
  def welcome

    set_meta_tags title: 'Herzlich Wilkommen', reverse: true,
              description: 'Die Stiftung "Tiere in Not - Animal Help" engagiert sich seit Jahren sowohl im institutionellen als auch im individuellen Tierschutz.',
              keywords: 'Tierschutz, Tierrecht, Tierrechte, Lebenshof, Gnadenhof'

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
