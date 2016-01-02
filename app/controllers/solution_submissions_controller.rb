class SolutionSubmissionsController < ApplicationController
  before_action :set_solution_submission, only: [:show, :edit, :update, :destroy]


# This function takes a user's solution as a string,
# generates Checker.java with the solution in it,
# compiles it, and runs
# The return value is either 
# 'Did not compile'
# 'Wrong answer'
# 'Correct answer!'
def run_checker user_solution
  # Remove Checker.java
  system 'rm -f Checker.java'

  # Generates Checker.java
  system 'cp /home/yancy/app/checker/CheckerTemplate /tmp/Checker.java'
  if !$?.success?
    raise 'Error while copying CheckerTemplate to /tmp/Checker.java.'
  end

  # Replace $s in Checker.java to user_solution
  file_name = '/tmp/Checker.java'
  text = File.read(file_name)
  new_contents = text.gsub("$s", user_solution)

  File.open(file_name, "w") {|file| file.puts new_contents }
#   if !$?.success?
#    raise "Error while inserting user's solution into Checker.java"
#   end

  # Compiling...
  system 'javac /tmp/Checker.java'
  if !$?.success?
    return 'Did not compile'
  end

  # Runs it
  input           = 'aBCdEfg'
  expected_output = 'abcdefg'
  system ('java -cp /tmp Checker ' + input + ' ' + expected_output)
  if !$?.success?
    return 'Wrong output'
  end

  return 'Correct answer!'
end

# The following is for testing purpuse

  # GET /solution_submissions
  # GET /solution_submissions.json
  def index
    @solution_submissions = SolutionSubmission.all
  end

  # GET /solution_submissions/1
  # GET /solution_submissions/1.json
  def show
    @output = run_checker params["comment"]
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
