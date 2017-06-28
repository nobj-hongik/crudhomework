class BaseballController < ApplicationController
  before_action :authenticate_user!

  def index
    
   @posts = Post.joins(:user).where(:users => { :typeofsports => "야구" })
  
  end
  
end
