module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      # GET /posts
      def index
        render json: Post.all
      end

      # GET /posts/:id
      def show
        render json: @post
      end

      # POST /posts
      def create
        @post = Post.new(post_params)
        if @post.save
          render json: @post
        else
          render json: {error: 'Failed to post.'}, status: 400
        end
      end

      # PUT /posts/:id
      def update
        if @post
          @post.update(post_params)
          render json: {message: 'Successfully posted!'}
        else
          render json: {error: 'Failed to update.'}, status: 400
        end
      end

      # DELETE /posts/:id
      def destroy
        if @post
          @post.destroy
          render json: {message: 'Successfully deleted!'}
        else
          render json: {error: 'Failed to delete.'}, status: 400
        end
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end