json.array!(@solution_submissions) do |solution_submission|
  json.extract! solution_submission, :id, :solition
  json.url solution_submission_url(solution_submission, format: :json)
end
