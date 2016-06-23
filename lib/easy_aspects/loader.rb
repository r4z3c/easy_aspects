module EasyAspects
  module Loader

    ROOT = File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

    class << self

      def load_easy_aspects
        Dir[File.expand_path(File.join(ROOT,'lib','easy_aspects','**/*.rb'))].each do |file|
          require file
        end
      end

    end

    load_easy_aspects

  end
end