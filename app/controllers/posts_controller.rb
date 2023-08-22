class PostsController < ApplicationController
  def new
    @post = Post.new
    @gear = Gear.find(params[:id])
  end

  def create
  end
end
