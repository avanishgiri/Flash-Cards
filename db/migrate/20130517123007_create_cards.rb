class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, :answer
      t.references :deck
    end
  end
end
