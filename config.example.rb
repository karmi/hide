module Hide
  extend self

  DEFAULT_CONFIG = {
    :path        => '/path/to/the/cloned/website',
    :branch      => 'master',
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
    },

    :server      => {
      :username => 'admin',
      :password => 'admin'
    }
  }

  def config(key)
    @config ||= DEFAULT_CONFIG
    @config[key]
  end
end
