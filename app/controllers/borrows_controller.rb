class BorrowsController < ApplicationController
  def index
    @borrows = Borrowed.all.order(:created_at).paginate(page: params[:page], per_page:20)
  end
  
  def new
  end
  
  
  def getByTitle
    respond_to do |format|
      format.html { render :partial => 'getByTitle'}
    end
  end
  
  def findByTitle
    @books = Book.where("title LIKE ?",'%'+params[:title]+'%')
    respond_to do |format|  
      format.html {render :partial => 'findByTitle'}
    end
    
  end
  
  def getByISBN
    respond_to do |format|
      format.html { render :partial=> 'getByISBN'}
    end
  end
  def getByAutor
    respond_to do |format|
      format.html { render :partial=> 'getByAutor'}
    end
  end
  
end
