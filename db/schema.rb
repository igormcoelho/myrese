# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160701195603) do

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities", ["position_id"], name: "index_activities_on_position_id"

  create_table "evaluations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "evaluations", ["user_id"], name: "index_evaluations_on_user_id"

  create_table "gfiles", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.integer  "infohash_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "filename_file_name"
    t.string   "filename_content_type"
    t.integer  "filename_file_size"
    t.datetime "filename_updated_at"
  end

  add_index "gfiles", ["infohash_id"], name: "index_gfiles_on_infohash_id"

  create_table "grants", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "funding_agency"
    t.integer  "project_id"
    t.integer  "profile_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "grants", ["profile_id"], name: "index_grants_on_profile_id"
  add_index "grants", ["project_id"], name: "index_grants_on_project_id"

  create_table "group_infohashes", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "infohash_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "group_infohashes", ["group_id"], name: "index_group_infohashes_on_group_id"
  add_index "group_infohashes", ["infohash_id"], name: "index_group_infohashes_on_infohash_id"

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id"
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id"

  create_table "groupmembers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groupmembers", ["group_id"], name: "index_groupmembers_on_group_id"
  add_index "groupmembers", ["user_id"], name: "index_groupmembers_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "htypes", force: :cascade do |t|
    t.string   "name"
    t.string   "shortname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infohash_users", force: :cascade do |t|
    t.integer  "infohash_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "infohash_users", ["infohash_id"], name: "index_infohash_users_on_infohash_id"
  add_index "infohash_users", ["user_id"], name: "index_infohash_users_on_user_id"

  create_table "infohashes", force: :cascade do |t|
    t.string   "code"
    t.string   "gtitle"
    t.text     "gdescription"
    t.integer  "visibility_id"
    t.integer  "user_id"
    t.integer  "htype_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "infohashes", ["htype_id"], name: "index_infohashes_on_htype_id"
  add_index "infohashes", ["user_id"], name: "index_infohashes_on_user_id"
  add_index "infohashes", ["visibility_id"], name: "index_infohashes_on_visibility_id"

  create_table "inforelations", force: :cascade do |t|
    t.integer  "infohash1_id"
    t.integer  "infohash2_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "instances", force: :cascade do |t|
    t.string   "name"
    t.string   "pubKey"
    t.datetime "pubKeyExpiration"
    t.string   "address"
    t.boolean  "allowAutomaticPull"
    t.boolean  "allowPull"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "logo"
    t.string   "address"
    t.string   "itype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "infohash_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "members", ["infohash_id"], name: "index_members_on_infohash_id"
  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "pauthors", force: :cascade do |t|
    t.integer  "publication_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pauthors", ["publication_id"], name: "index_pauthors_on_publication_id"
  add_index "pauthors", ["user_id"], name: "index_pauthors_on_user_id"

  create_table "pkeywords", force: :cascade do |t|
    t.integer  "publication_id"
    t.integer  "infohash_id"
    t.string   "keyword"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pkeywords", ["infohash_id"], name: "index_pkeywords_on_infohash_id"
  add_index "pkeywords", ["publication_id"], name: "index_pkeywords_on_publication_id"

  create_table "positions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "profile_id"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "positions", ["institution_id"], name: "index_positions_on_institution_id"
  add_index "positions", ["profile_id"], name: "index_positions_on_profile_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "infohash_id"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["infohash_id"], name: "index_posts_on_infohash_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "fullname"
    t.string   "citation"
    t.text     "shortbio"
    t.integer  "user_id"
    t.integer  "visibility_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"
  add_index "profiles", ["visibility_id"], name: "index_profiles_on_visibility_id"

  create_table "project_profiles", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "profile_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "project_profiles", ["profile_id"], name: "index_project_profiles_on_profile_id"
  add_index "project_profiles", ["project_id"], name: "index_project_profiles_on_project_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "abstract"
    t.string   "keywords"
    t.integer  "profile_id"
    t.integer  "infohash_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["infohash_id"], name: "index_projects_on_infohash_id"
  add_index "projects", ["profile_id"], name: "index_projects_on_profile_id"

  create_table "publication_profiles", force: :cascade do |t|
    t.integer  "publication_id"
    t.string   "author"
    t.integer  "profile_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "publication_profiles", ["profile_id"], name: "index_publication_profiles_on_profile_id"
  add_index "publication_profiles", ["publication_id"], name: "index_publication_profiles_on_publication_id"

  create_table "publications", force: :cascade do |t|
    t.integer  "pubtype_id"
    t.string   "title"
    t.integer  "year"
    t.string   "ctitle"
    t.string   "issn"
    t.string   "isbn"
    t.string   "editor"
    t.string   "publisher"
    t.string   "organization"
    t.string   "address"
    t.string   "month"
    t.integer  "volume"
    t.integer  "number"
    t.string   "series"
    t.integer  "page_begin"
    t.integer  "page_end"
    t.string   "howpublished"
    t.string   "doi"
    t.string   "keywords"
    t.text     "other"
    t.integer  "infohash_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "publications", ["infohash_id"], name: "index_publications_on_infohash_id"
  add_index "publications", ["pubtype_id"], name: "index_publications_on_pubtype_id"

  create_table "pubtypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualis_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualis_classifications", force: :cascade do |t|
    t.string   "classification"
    t.integer  "qualis_area_id"
    t.integer  "qualis_journal_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "qualis_classifications", ["qualis_area_id"], name: "index_qualis_classifications_on_qualis_area_id"
  add_index "qualis_classifications", ["qualis_journal_id"], name: "index_qualis_classifications_on_qualis_journal_id"

  create_table "qualis_evaluate_journals", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "year_begin"
    t.integer  "year_end"
    t.integer  "evaluation_id"
    t.string   "target_qualis"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "qualis_evaluate_journals", ["evaluation_id"], name: "index_qualis_evaluate_journals_on_evaluation_id"
  add_index "qualis_evaluate_journals", ["profile_id"], name: "index_qualis_evaluate_journals_on_profile_id"

  create_table "qualis_journals", force: :cascade do |t|
    t.string   "journal"
    t.string   "issn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.datetime "dtime"
    t.integer  "infohash_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reminders", ["infohash_id"], name: "index_reminders_on_infohash_id"

  create_table "supervisions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "suptype"
    t.boolean  "mainsup"
    t.integer  "profile_id"
    t.date     "date_begin"
    t.date     "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "supervisions", ["profile_id"], name: "index_supervisions_on_profile_id"
  add_index "supervisions", ["user_id"], name: "index_supervisions_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "tagname"
    t.integer  "infohash_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tags", ["infohash_id"], name: "index_tags_on_infohash_id"
  add_index "tags", ["user_id"], name: "index_tags_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "visibilities", force: :cascade do |t|
    t.string   "vtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weblinks", force: :cascade do |t|
    t.integer  "infohash_id"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "weblinks", ["infohash_id"], name: "index_weblinks_on_infohash_id"

end
