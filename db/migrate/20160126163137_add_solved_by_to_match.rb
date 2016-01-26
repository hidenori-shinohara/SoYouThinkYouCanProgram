class AddSolvedByToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :solved_by, :string
  end
end
