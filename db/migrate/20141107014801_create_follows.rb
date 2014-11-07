class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :follower, index: true
      t.references :followable, index: true, polymorphic: true

      t.timestamps
    end
  end
end
