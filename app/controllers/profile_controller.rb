class ProfileController < ApplicationController
    before_action :set_book, only: [:create, :destroy]
    
    def create
        @profile = @book.profile.new(profile_params)
        if @profile.save
            redirect_to @book, notice:'Ficha creada!'
        else
            redirect_to @book, alert: 'No se creo la Ficha'
        end
    end
    
    def destroy
        @profile = @book.profile.find(params[:id])
        @profile.destroy
        redirect_to @book, notice:'Ficha eliminada!'
    end
    private
        def set_book
            @book = Book.find(params[:book_id])
        end
        
        def profile_params
            params.require(:profile).permit(:copy, :volumen, :tome, :accesible)
        end
end