if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        def per(value = nil) per_page(value) end
        def total_count() count end
      end
    end
    module CollectionMethods
      alias_method :num_pages, :total_pages
    end
  end
end

require 'will_paginate/array'

MAX_NUMBER_OF_SKIP_VALUE = 2147483647 # 2**31 - 1
DEFAULT_NO_OF_PAGES = 30