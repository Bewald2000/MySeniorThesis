class AddStatusToAwards < ActiveRecord::Migration[7.1]
  def change
    add_column :awards, :status, :string
  end
end
