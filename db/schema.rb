# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171103031736) do

  create_table "scores", force: :cascade do |t|
    t.string "username"
    t.float "total"
    t.integer "jumps"
    t.integer "deaths"
    t.integer "longest_streak"
    t.string "bestjump_type"
    t.float "bestjump_points"
    t.float "easy"
    t.integer "easy_jumps"
    t.integer "gate_jumps"
    t.integer "gate_streak"
    t.float "gate_points"
    t.integer "diagonal_jumps"
    t.integer "diagonal_streak"
    t.float "diagonal_points"
    t.integer "fjump_jumps"
    t.integer "fjump_streak"
    t.float "fjump_points"
    t.integer "sgate_jumps"
    t.integer "sgate_streak"
    t.float "sgate_points"
    t.integer "platform_jumps"
    t.integer "platform_streak"
    t.float "platform_points"
    t.float "medium"
    t.integer "medium_jumps"
    t.integer "cascade_jumps"
    t.integer "cascade_streak"
    t.float "cascade_points"
    t.integer "tbone_jumps"
    t.integer "tbone_streak"
    t.float "tbone_points"
    t.integer "mjump2_jumps"
    t.integer "mjump2_streak"
    t.float "mjump2_points"
    t.integer "shuriken_jumps"
    t.integer "shuriken_streak"
    t.float "shuriken_points"
    t.integer "hdiamond_jumps"
    t.integer "hdiamond_streak"
    t.float "hdiamond_points"
    t.float "hard"
    t.integer "hard_jumps"
    t.integer "mjump1_jumps"
    t.integer "mjump1_streak"
    t.float "mjump1_points"
    t.integer "diamond_jumps"
    t.integer "diamond_streak"
    t.float "diamond_points"
    t.integer "bubble_jumps"
    t.integer "bubble_streak"
    t.float "bubble_points"
    t.integer "vortex_jumps"
    t.integer "vortex_streak"
    t.float "vortex_points"
    t.integer "hourglass_jumps"
    t.integer "hourglass_streak"
    t.float "hourglass_points"
    t.float "hardest"
    t.integer "hardest_jumps"
    t.integer "plane_jumps"
    t.integer "plane_streak"
    t.float "plane_points"
    t.integer "corner_jumps"
    t.integer "corner_streak"
    t.float "corner_points"
    t.integer "valve_jumps"
    t.integer "valve_streak"
    t.float "valve_points"
    t.integer "ninejump_jumps"
    t.integer "ninejump_streak"
    t.float "ninejump_points"
    t.integer "ddiamond_jumps"
    t.integer "ddiamond_streak"
    t.float "ddiamond_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
