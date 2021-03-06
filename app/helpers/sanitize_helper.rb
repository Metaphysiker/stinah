module SanitizeHelper
  def sanitizing(content)



    youtube_transformer = lambda do |env|
      node      = env[:node]
      node_name = env[:node_name]

      # Don't continue if this node is already whitelisted or is not an element.
      return if env[:is_whitelisted] || !node.element?

      # Don't continue unless the node is an iframe.
      return unless node_name == 'iframe'

      # Verify that the video URL is actually a valid YouTube video URL.
      return unless node['src'] =~ %r|\A(?:https?:)?//(?:www\.)?youtube(?:-nocookie)?\.com/|

      # We're now certain that this is a YouTube embed, but we still need to run
      # it through a special Sanitize step to ensure that no unwanted elements or
      # attributes that don't belong in a YouTube embed can sneak in.
      Sanitize.node!(node, {
        :elements => %w[iframe],

        :attributes => {
          'iframe'  => %w[allowfullscreen frameborder height src width]
        }
      })

      # Now that we're sure that this is a valid YouTube embed and that there are
      # no unwanted elements or attributes hidden inside it, we can tell Sanitize
      # to whitelist the current node.
      {:node_whitelist => [node]}
    end


    Sanitize.fragment(content, :transformers => youtube_transformer)

    Sanitize.fragment(content, Sanitize::Config.merge(
      Sanitize::Config::RELAXED,
      :transformers => youtube_transformer
    ))


  end
end
