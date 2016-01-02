class CreateSolutionSubmissions < ActiveRecord::Migration
  def change
    create_table :solution_submissions do |t|
      t.string :solition

      t.timestamps null: false
    end
  end
end
