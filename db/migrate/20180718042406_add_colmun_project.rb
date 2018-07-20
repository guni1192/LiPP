class AddColmunProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :expose, :integer
  end
end
