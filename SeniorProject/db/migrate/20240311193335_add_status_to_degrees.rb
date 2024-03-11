class AddStatusToDegrees < ActiveRecord::Migration[7.1]
  def change
    add_column :degrees, :status, :string
  end
end
