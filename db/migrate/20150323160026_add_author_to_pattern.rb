class AddAuthorToPattern < ActiveRecord::Migration
  def change
    add_column :patterns, :author, :string
    update "UPDATE patterns SET author='Unknown author'"
  end
end
