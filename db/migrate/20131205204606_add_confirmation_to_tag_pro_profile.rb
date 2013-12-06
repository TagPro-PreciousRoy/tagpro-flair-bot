class AddConfirmationToTagProProfile < ActiveRecord::Migration
  def change
    add_column :tag_pro_profiles, :confirmation_token, :string
    add_column :tag_pro_profiles, :confirmed_at, :datetime
  end
end
