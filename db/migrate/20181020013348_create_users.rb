class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :lists do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: {on_delete: :cascade}
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.boolean :status, default: false
      t.references :list, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
