# TODO: Figure out how to fit this into a REST API and make it play nicely with Rails controllers / route helpers / etc

# For this use case, you could also create a separate model like Blog::Post::Publication or Blog::Post::Release
# By doing things like that more (splitting out a domain model for the act of updating another model), we'd get built in
# change tracking that's easier to query than a single table like we have with audited which is designed more for tracking
# who changed what across models rather than a granular history of specific types of actions taken on specific resources.
# A side effect of creating the Publication or Release would be updating the blog post (if that's even required - you could also
# just calculate the status of a post based on its publication history; sort of an event-sourcing approach)

# A lot of times, I think having a bunch of services that all do things to a single model are a code smell of missing domain objects

module Blog
  module Posts
    class PublishService
      def initialize(post)
        @post = post
      end

      def call
        # Your business logic for publishing a Post goes here
        puts "MY POST PUBLISH SERVICE #{post}"
      end

      private

      attr_reader :post
    end
  end
end
