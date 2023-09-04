class PostsController < ApplicationController
  def new
    @post = Post.new
    @gear = Gear.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to gears_show_path(@post.gear_id), notice: '投稿が完了しました'
    else
      @gear = Gear.find(@post.gear_id)
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:score, :review, :gear_id)
    end
end
