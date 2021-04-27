class JournalsController < ApplicationController
    def index
        @journals=Journal.filter(params[:check_cash])
        
    end

    def show
        @journal = Journal.find(params[:id])
    end

    def new
        @journal = Journal.new
    end

    def create
        journal = Journal.new(journal_params)
        if journal.valid?
            journal.save!
        else
            puts "Error"
        end

        redirect_to journals_path
    end

    def edit
        @journal = Journal.find(params[:id])
    end

    def update
        journal = Journal.find(params[:id])
        journal.update(journal_params)

        redirect_to journal_path(journal)
    end

    def destroy
        journal = Journal.find(params[:id])
        journal.destroy

        redirect_to journals_path
    end

    private

    def journal_params
        params.require(:journal).permit(:title, :date, :cash_inOut , :amount , :user_id)
    end
end
