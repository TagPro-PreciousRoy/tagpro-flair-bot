class CreateTagProProfiles < ActiveRecord::Migration
  def change
    create_table :tag_pro_profiles do |t|
      t.references :user, index: { unique: true }
      t.string :server
      t.string :uid

      t.timestamps
    end

    add_index :tag_pro_profiles, [:server, :uid], unique: true
  end
end
