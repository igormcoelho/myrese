class QualisEvaluateJournalsController < ApplicationController
  before_action :set_qualis_evaluate_journal, only: [:show, :edit, :update, :destroy]

  # GET /qualis_evaluate_journals
  # GET /qualis_evaluate_journals.json
  def index
    @qualis_evaluate_journals = QualisEvaluateJournal.all
  end

  # GET /qualis_evaluate_journals/1
  # GET /qualis_evaluate_journals/1.json
  def show
  end

  # GET /qualis_evaluate_journals/new
  def new
    @qualis_evaluate_journal = QualisEvaluateJournal.new
  end

  # GET /qualis_evaluate_journals/1/edit
  def edit
  end

  # POST /qualis_evaluate_journals
  # POST /qualis_evaluate_journals.json
  def create
    @qualis_evaluate_journal = QualisEvaluateJournal.new(qualis_evaluate_journal_params)

    respond_to do |format|
      if @qualis_evaluate_journal.save
        format.html { redirect_to @qualis_evaluate_journal, notice: 'Qualis evaluate journal was successfully created.' }
        format.json { render :show, status: :created, location: @qualis_evaluate_journal }
      else
        format.html { render :new }
        format.json { render json: @qualis_evaluate_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qualis_evaluate_journals/1
  # PATCH/PUT /qualis_evaluate_journals/1.json
  def update
    respond_to do |format|
      if @qualis_evaluate_journal.update(qualis_evaluate_journal_params)
        format.html { redirect_to @qualis_evaluate_journal, notice: 'Qualis evaluate journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @qualis_evaluate_journal }
      else
        format.html { render :edit }
        format.json { render json: @qualis_evaluate_journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualis_evaluate_journals/1
  # DELETE /qualis_evaluate_journals/1.json
  def destroy
    @qualis_evaluate_journal.destroy
    respond_to do |format|
      format.html { redirect_to qualis_evaluate_journals_url, notice: 'Qualis evaluate journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualis_evaluate_journal
      @qualis_evaluate_journal = QualisEvaluateJournal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qualis_evaluate_journal_params
      params.require(:qualis_evaluate_journal).permit(:profile_id, :year_begin, :year_end, :evaluation_id, :target_qualis)
    end
end
