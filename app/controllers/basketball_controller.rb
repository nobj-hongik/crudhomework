class BasketballController < ApplicationController
  before_action :authenticate_user!

  def index
  
       
    @posts = Post.joins(:user).where(:users => { :typeofsports => "농구" })
    

  end
end
