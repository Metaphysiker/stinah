# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.stinah.ch"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add about_path, :priority => 1.0
  add animals_path, :priority => 1.0
  add support_path, :priority => 1.0
  add internship_path, :priority => 0.9

  Animal.all.each do |animal|
    add animal_path(animal), :priority => 1.0, :lastmod => animal.updated_at
  end

  add new_home_offer_path, :priority => 0.9
  add new_home_request_path, :priority => 0.9

  add posts_path,  :priority => 0.7, :changefreq => 'weekly'

  Post.all.each do |post|
    add post_path(post), :priority => 0.7, :lastmod => post.updated_at
  end

  add newhome_path, :priority => 0.6
  add faq_path, :priority => 0.6
  add internship_path, :priority => 0.6
  add contact_path
  add impressum_path, :priority => 0.3
  add cookies_path, :priority => 0.2


end
