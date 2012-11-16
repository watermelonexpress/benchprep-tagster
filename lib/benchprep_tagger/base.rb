module Benchprep
  module Tagger
    class << self

      def tag
        check_git
        puts latest_tag
      end

      def check_git
        print "Checking the git repo..."

        # if response.code != 200
        #   puts "✗".red
        #   return
        # else
        #   puts "✓".green
        # end
      end

      def latest_tag
        `git describe --abbrev=0 --tags`
      end
    end
  end
end
