module Blog
  module Posts
    class Update < ApplicationService
      alias_attribute :post, :object
      attribute :attrs

      # It probably works best to follow convention with return value for things like this.
      # If we return the post object, the standard Rails controller won't work.
      # By passing along the result of `.update`, we can handle validation errors the same way you
      # would in any normal Rails controller

      # Otherwise, I think we have to ensure that we always use the ! version of every
      # ActiveRecord

      # def update
      #   respond_to do |format|
      #     if Blog::Posts::Update.call(post: @blog_post, attrs: blog_post_params)
      #       format.html { redirect_to @blog_post, notice: "Post was successfully updated." }
      #       format.json { render :show, status: :ok, location: @blog_post }
      #     else
      #       format.html { render :edit, status: :unprocessable_entity }
      #       format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      #     end
      #   end
      # end

      def call
        post.update(attrs)
      end
    end
  end
end
