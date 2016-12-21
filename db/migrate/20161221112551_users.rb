class Users < ActiveRecord::Migration[5.0]
  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
