class IdentityMigration < ActiveRecord::Migration[5.0]
  def up
    create_table :identities do |t|
      t.string :provider
      t.string :uid
      t.string :accesstoken
      t.string :refreshtoken
      t.string :name
      t.string :email
      t.string :nickname
      t.string :image
      t.string :phone
      t.string :urls

      t.timestamps
    end
  end
end
