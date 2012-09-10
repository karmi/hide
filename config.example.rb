module Hide
  extend self

  DEFAULT_CONFIG = {
    :path        => '/path/to/the/cloned/website',
    :branch      => 'master',
    :directories => ['guide', 'community', 'tutorials', 'videos'],
    :index_name  => 'elastic-search-website',

    :settings => {
       :analysis => {
          :filter => {
             :ngrams => {:type => 'edgeNGram', :max_gram => 30},
             :word_delim => {:type => 'word_delimiter', :preserve_original => 1},
          },
          :analyzer => {
             :content => {
                :filter => ['standard','lowercase','word_delim','ngrams'],
                :type => 'custom',
                :tokenizer => 'standard'
             }
          }
       }
    },

    :mappings => {
      :guide => {
        :properties => {
          :title => { :type => 'string', :boost => 2.0, :analyzer => 'content' },
          :content => { :type => 'string', :analyzer => 'content' },
          :id => { :type => 'string', :index => 'not_analyzed', :include_in_all => false },
          :url => { :type => 'string', :index => 'not_analyzed', :include_in_all => false },
          :category => { :type => 'string', :analyzer => 'keyword', :include_in_all => false },

        },
        :_all => { :analyzer => 'content' }
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
