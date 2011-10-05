class AttrsController < ApplicationController
  before_filter :find_able
  before_filter :authenticate_user!,:except =>[:index,:show]
  def index
    @attrs = Hash.new
    @able.attrs.supported.each{|attr| @attrs[attr.name] = attr.value}

    render :json => @attrs
  end

  def show
  end

  def create
  end

  def review
  end

private

  def find_able
    params.each do |name, value|
        if name =~ /(.+)_id$/
            return @able = $1.classify.constantize.find(value)  
        end  
    end  
    nil  
  end

end
