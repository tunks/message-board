class AddFirstnameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :first_name, :string
  end
end
