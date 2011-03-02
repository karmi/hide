module Hide
  extend self

  DEFAULT_CONFIG = {
    :path        => '/path/to/the/cloned/website',
    :directories => ['guide', 'community', 'tutorials', 'videos']
  }

  def config(key)
    @config ||= DEFAULT_CONFIG
    @config[key]
  end
end
