
class ProfileController < ApplicationController
    before_action :set_book, only:[:create, :update, :destroy]
    
    def create
        @profile = @book.build_profile(profile_params)
        if @profile.save
            redirect_to @book, notice:"Ficha creada!"
        else
            redirect_to @book, alert:"No se creo la ficha!"
        end
    end
    
    def update
      if @profile = @book.create_profile(profile_params)
        format.html { redirect_to @book, notice: 'Libro actualizado' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
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
            params.require(:profile).permit(:copy, :volumen, :tome, :accessible)
        end
end
