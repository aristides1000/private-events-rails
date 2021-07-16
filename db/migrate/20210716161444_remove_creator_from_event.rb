class RemoveCreatorFromEvent < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :events, :creator
  end
end
