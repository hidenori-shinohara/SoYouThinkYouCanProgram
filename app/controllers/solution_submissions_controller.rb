class SolutionSubmissionsController < ApplicationController
  before_action :set_solution_submission, only: [:show, :edit, :update, :destroy]

  # GET /solution_submissions
  # GET /solution_submissions.json
  def index
    @solution_submissions = SolutionSubmission.all
  end

  # GET /solution_submissions/1
  # GET /solution_submissions/1.json
  def show
  end

  # GET /solution_submissions/new
  def new
    @solution_submission = SolutionSubmission.new
  end

  # GET /solution_submissions/1/edit
  def edit
  end

  # POST /solution_submissions
  # POST /solution_submissions.json
  def create
    @solution_submission = SolutionSubmission.new(solution_submission_params)

    respond_to do |format|
      if @solution_submission.save
        format.html { redirect_to @solution_submission, notice: 'Solution submission was successfully created.' }
        format.json { render :show, status: :created, location: @solution_submission }
      else
        format.html { render :new }
        format.json { render json: @solution_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solution_submissions/1
  # PATCH/PUT /solution_submissions/1.json
  def update
    respond_to do |format|
      if @solution_submission.update(solution_submission_params)
        format.html { redirect_to @solution_submission, notice: 'Solution submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @solution_submission }
      else
        format.html { render :edit }
        format.json { render json: @solution_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solution_submissions/1
  # DELETE /solution_submissions/1.json
  def destroy
    @solution_submission.destroy
    respond_to do |format|
      format.html { redirect_to solution_submissions_url, notice: 'Solution submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution_submission
      #@solution_submission = SolutionSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_submission_params
      params.require(:solution_submission).permit(:solition)
    end
end
