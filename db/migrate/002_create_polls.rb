class CreatePolls < ActiveRecord::Migration[5.2]
    def change
      create_table :polls do |t|
        t.integer :user_id
        t.integer :poll_id
        t.integer :question_id
        t.string :question
      end
    end
  end