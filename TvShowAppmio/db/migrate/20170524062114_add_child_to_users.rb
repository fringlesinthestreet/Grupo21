class AddChildToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :child, :boolean, default: false
  end
end
