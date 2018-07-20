class AddNameToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :name, :string
    add_column :projects, :full_name, :string
    add_column :projects, :gh_user, :string
  end
end
