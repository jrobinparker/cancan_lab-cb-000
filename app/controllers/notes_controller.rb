class NotesController < ApplicationController
  load_and_authorize_resource
  before_filter :set_note, only: [:show, :edit, :update, :destroy]
  
  def index
    @notes = Note.all 
  end 
  
  def show 
  end 
  
  def new 
    @note = Note.new 
  end 
  
  def create 
    
    @note = Note.create(note_params)
    if @note.save 
      redirect_to note_path(@note)
    else
      render :new 
    end 
  end 
  
  def edit 
  end
  
  def update 
    if @note.update 
      redirect_to note_path(@note)
    else 
      render :edit 
    end 
  end 
  
  def destroy
    @note.destroy
    redirect_to notes_path
  end 
  
  private 
  
  def note_params 
    params.require(:note).permit(:content, users_attributes: [:name])
  end
  
  def set_note 
    @note = Note.find(params[:id])
  end 
  
end
