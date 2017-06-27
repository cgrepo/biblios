class BorrowsController < ApplicationController
  def index
    @borrows = Borrowed.all.where(returned:false).order(:created_at).paginate(page: params[:page], per_page:20)
  end
  def new
  end
  def setReturned
    @borrow = Borrowed.find_by(:id => params[:borrow])
    @borrow.returned = true
    respond_to do |format|
      if @borrow.save
        format.html {redirect_to borrows_url, notice:'Libro entregado!'}
      else
        format.html {redirect_to borrows_url, flash[:error] = 'Error al salvar!'}
      end
    end
  end
  def create
    @borrows = []
    setFailFlag(false)
    @subscriptor = Subscriptor.find_by(account:params[:account])
    respond_to do |format|
        @books = Book.where(id:params[:borrows])
        @books.each_with_index do |book,index|
          unless Borrowed.subscriptor_limit_reached?(@subscriptor)
            @borrow = Borrowed.new()
            @borrow.book = book
            @borrow.subscriptor = @subscriptor
            @borrow.outDate = params[:outDate]
            @borrow.returnDate = params[:returnDate]
            @borrow.returned = false
            unless @borrow.save
              setFailFlag(true)
            else
              @borrows << book
            end
          else
            #------
              #format.json { render text:'Error el usuario ya tienes 3 prestamos!', status: :bad_request}
              #format.json { render :json => { :errors => 'Error el usuario ya tienes 3 prestamos!'}}
              #format.html { render  text:'Error el usuario ya tienes 3 prestamos!'}
            format.html { render :partial => 'limitError', locals:{:savedBooks => @borrows
            #@books[index-1].id
            } }
            setFailFlag(true)
            break
          end
        end
        format.html { redirect_to borrows_url, notice: 'Prestamo(s) cargados correctamente' unless @failFlag }
    end
  end
  def getByTitle
    respond_to do |format|
      format.html { render :partial => 'getByTitle'}
    end
  end
  def findByTitle
    @books = Book.where("title LIKE ?",'%'+params[:borrow][:title]+'%')
    respond_to do |format|  
      format.html {render :partial => 'findByTitle'}
    end
  end
  def getByISBN
    respond_to do |format|
      format.html { render :partial=> 'getByISBN'}
    end
  end
  def findByISBN
    @book = Book.find_by(isbn:params[:borrow][:isbn])
    respond_to do |format|  
      format.html {render :partial => 'findByISBN'}
    end
  end
  def getByAutor
    respond_to do |format|
      format.html { render :partial=> 'getByAutor'}
    end
  end
  def findByAutor
    @books = Book.where("autor LIKE ?",'%'+params[:borrow][:autor]+'%')
    respond_to do |format|  
      format.html {render :partial => 'findByAutor'}
    end
  end
  def getByName
    respond_to do |format|
      format.html { render :partial=> 'getByName'}
    end
  end
  def findByName
    @subscriptors = Subscriptor.where("fullname LIKE ?",'%'+params[:borrow][:name]+'%')
    @rents = []
    @subscriptors.each do |subscriptor|
      @rents << Borrowed.all.where(subscriptor:subscriptor).where(returned:false).count
    end
    respond_to do |format|  
      format.html {render :partial => 'findSubByName'}
    end
  end
  def getByAcc
    respond_to do |format|
      format.html { render :partial=> 'getSubscriptorAcc'}
    end
  end
  def findByAcc
    @subscriptor = Subscriptor.find_by account:params[:borrow][:account]
    @rents = []
    @rents << Borrowed.all.where(subscriptor:@subscriptor).where(returned:false).count
    respond_to do |format|  
      format.html {render :partial => 'findSubByAcc'}
    end    
  end
#---------4 INDEx---------------------------------------------------
  def orBorrows
    case params[:order][:index]
      when 'Libro'
        @borrows = Borrowed.where(returned:false).order(:book_id)
      when 'Subscriptor'
        @borrows = Borrowed.where(returned:false).order(:subscriptor_id)
      when 'Fecha salida'
        @borrows = Borrowed.where(returned:false).order(:outDate)
      when 'Fecha Regreso'
        @borrows = Borrowed.where(returned:false).order(:returnDate)
    end
    respond_to do |format|  
      format.html {render :partial => 'ordered'}
    end 
  end
  def srchSubName
    subscriptors = []
    subscriptors = Subscriptor.where("fullname LIKE ?",'%'+params[:borrow][:name]+'%').pluck :id
    @borrows = Borrowed.where(returned:false).where(:subscriptor_id => subscriptors)
    respond_to do |format|
      format.html {render :partial => 'ordered'}
    end
  end
#----------PRIVATES-------------------------------------------------
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def borrow_paramsreturnDate
      params.require(:borrow).permit(:title, :name, :account, :isbn, :autor, :outDate, :returnDate, :borrow, :order)
    end
    
    def setFailFlag(val)
      @failFlag = val
    end
end
