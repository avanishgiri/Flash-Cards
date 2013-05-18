class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :deck, :user
      t.integer :num_correct, :default => 0
    end
  end
end
