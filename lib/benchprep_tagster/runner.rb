# encoding: UTF-8
module Benchprep
  module Tagster
    class Runner
      def initialize(opts)
        @level   = opts[:level]
        @dry_run = !!opts[:dry_run]
      end

      def dry_run
        puts "** DRY RUN **".green
        process
        puts "** COMPLETE **".green
      end

      def real_run
        puts "** TAGGING **".green
        process
        puts "** COMPLETE **".green
      end

      def run
        @dry_run ? dry_run : real_run
      end

    private

      def process
        check_git
        fetch_latest_tags
        check_latest_tag
        identify_tag
        create_tag
        push_tag
      end

      def create_tag
        if @dry_run
          puts "Not creating tag #{@new_tag}".yellow
          return
        end

        user = `whoami`
        msg  = "Tag generated at #{Time.now} by #{user} using Benchprep Tagger."
        print "Creating tag locally - ".green

        if `git tag -a "#{@new_tag}" -m "#{msg}"`
          puts "✓".green
        else
          puts "✗".red
          puts "Failed to create tag locally".red
        end
      end

      def push_tag
        if @dry_run
          puts "Not pushing tag #{@new_tag}".yellow
          return
        end

        print "Pushing tag to remote - ".green
        if `git push --tags`
          puts "✓".green
        else
          puts "✗".red
          puts "Failed to push tag to remote".red
        end
      end

      def identify_tag
        print "Generating new tag - ".green
        begin
          parts      = @latest_tag.split(".")
          major      = parts[-2].to_i
          minor, sha = parts[-1].split('_')
          msg        = parts[0...-2].join('.')
          minor      = minor.to_i + 1 if @level == :minor
          if @level == :major
            major += 1
            minor = 0
          end
          @new_tag   = "#{msg}.#{major}.#{minor}_#{latest_sha[0..4]}"
          puts @new_tag.green
        rescue Exception => e
          puts "Failed to generate new tag".red
        end
      end

      def check_git
        print "Checking the git repo - ".green
        if `git rev-parse --git-dir`
          puts "✓".green
        else
          puts "✗".red
          puts "Please run tag in the git repo".red
        end
      end

      def check_latest_tag
        print "Finding latest remote tag - ".green
        print latest_tag.green
      end

      def latest_tag
        @latest_tag ||= `git describe --abbrev=0 --tags`.to_s
        @latest_tag = 'v0.0.0_0' if @latest_tag.empty?
        return @latest_tag
      end

      def latest_sha
        @latest_sha ||= `git rev-parse --verify HEAD`.to_s
      end

      def fetch_latest_tags
        puts "Fetching latest tags".green
        `git fetch --tags`
      end

    end
  end
end
