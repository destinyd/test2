class CommentsController < ApplicationController
  before_filter :find_commentable
  before_filter :authenticate_user!,:except =>[:index]

  def index
    @comments = @commentable.comments
  end
  
  def create
    @comment = current_user.comments.new(params[:comment])
    @comment.commentable = @commentable
    @comment.save

    @comments = @commentable.comments.paginate(:per_page => 10, :page => params[:comments_page])
  end

private

  def find_commentable
    params.each do |name, value|
        if name =~ /(.+)_id$/
            return @commentable = $1.classify.constantize.find(value)  
        end  
    end  
    nil  
  end

end
