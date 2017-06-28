class PostsController < ApplicationController
before_action :authenticate_user!
 before_action :check_ownership, only: [:edit, :update, :destroy]

  def index
    
      @posts = Post.joins(:user).where(:users => { :typeofsports => "축구" })
      
  end
  
  def new
    
  end
  
  
  def create
  new_post = Post.new(user_id: current_user.id, content: params[:content], image: params[:image])

  if new_post.save
    if current_user.typeofsports == '야구'
      redirect_to posts_baseball_path
    elsif current_user.typeofsports == '농구'
      redirect_to posts_basketball_path
    elsif current_user.typeofsports == '축구'
      redirect_to posts_path
    else
    redirect_to new_post_path
    end
  end  
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
  
      @post.content = params[:content]
  
      if @post.save
          redirect_to root_path
      else
          render :edit
      end
  end
  
  def destroy
      @post.destroy
      redirect_to root_path
  end
  
    private
  
  def check_ownership
      @post = Post.find_by(id: params[:id])
      redirect_to root_path if @post.user.id != current_user.id
  end
  
  end
