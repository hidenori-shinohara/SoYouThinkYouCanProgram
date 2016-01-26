class AddProblemsToMatches < ActiveRecord::Migration
  def change
    add_reference :matches, :problem, index: true
    add_foreign_key :matches, :problems
  end
end
