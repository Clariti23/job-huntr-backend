class NotesController < ApplicationController
    skip_before_action :authorized

    def index 
        notes = Note.all 
        render json: notes
    end

    def show
        note = Note.find(params[:id])
        render json: note
      end 

    def create 
        @new = Note.create(note_params)
    end

    private

    def note_params
        params.require(:note).permit(:content, :lead_id)
    end    

end
