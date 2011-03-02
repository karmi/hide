module Hide
  extend self

  DEFAULT_CONFIG = {
    :path        => '/path/to/the/cloned/website',
    :directories => ['guide', 'community', 'tutorials', 'videos'],
    :mappings    => {
      :guide => {
        :properties => {
          :title    => { :type => 'string', :boost => 2.0,            :analyzer => 'snowball' },
          :content  => { :type => 'string', :analyzer => 'snowball' },
          :id       => { :type => 'string', :index => 'not_analyzed', :include_in_all => false },
          :url      => { :type => 'string', :index => 'not_analyzed', :include_in_all => false },
          :category => { :type => 'string', :analyzer => 'keyword',   :include_in_all => false },
          
        }
      }
    }
  }

  def config(key)
    @config ||= DEFAULT_CONFIG
    @config[key]
  end
end
