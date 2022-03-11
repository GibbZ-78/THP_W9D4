class AddReadToEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :read, :boolean
    add_column :emails, :image, :string
  end
end
