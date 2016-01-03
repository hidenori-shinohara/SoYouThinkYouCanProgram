class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :desc
      t.string :output
      t.string :input
      t.string :func_type
      t.string :signature

      t.timestamps null: false
    end
  end
end
