class CreateBoardTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :board_tag_relations do |t|

      t.timestamps
    end
  end
end
