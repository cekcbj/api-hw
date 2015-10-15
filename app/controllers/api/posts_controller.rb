class Api::PostsController < ApplicationController


  before_action do
    request.format = :json
  end

  def show
  @post = Post.find params[:id]
   end

 def index
   @posts = Post.all
 end


def create

  @post = Post.new params.require(:post).permit(:title)
  if @post.save
     render status: 201, json: @post
   else
     render status: 422, json: @post.errors
   end
end


def update
  @post = Post.find params[:id]
  if @post.save
  render status: 201, json: @post
  else
  render status: 422, json: @post.errors
  end
end

def destroy
  @post = Post.find params[:id]
  @post.destroy
  render status: 201, json: @post
end

end
