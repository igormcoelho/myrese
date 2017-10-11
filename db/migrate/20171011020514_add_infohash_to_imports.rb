class AddInfohashToImports < ActiveRecord::Migration
  def change
    add_reference :imports, :infohash, index: true, foreign_key: true
  end
end
