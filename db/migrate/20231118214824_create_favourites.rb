class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|
      t.string :title
      t.string :embed_link
      t.string :user_uid
      t.string :logged_user

      t.timestamps
    end
  end
end
