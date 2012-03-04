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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120304060507) do

  create_table "abreviaciones", :force => true do |t|
    t.string   "nombre"
    t.integer  "universidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autenticaciones", :force => true do |t|
    t.integer  "usuario_id"
    t.string   "provedor"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calificaciones", :force => true do |t|
    t.integer  "puntualidad",           :default => 0
    t.integer  "amigable",              :default => 0
    t.integer  "conocimiento",          :default => 0
    t.integer  "claridad",              :default => 0
    t.integer  "flexibilidad",          :default => 0
    t.float    "promedio"
    t.text     "critica"
    t.integer  "facilidad",             :default => 0
    t.float    "calificacion_obtenida"
    t.integer  "usuario_id"
    t.integer  "curso_profesor_id"
    t.integer  "likes_count",           :default => 0
    t.integer  "flags_count",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campus", :force => true do |t|
    t.string   "nombre"
    t.string   "ciudad"
    t.string   "estado"
    t.integer  "universidad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", :force => true do |t|
    t.text     "comentario"
    t.integer  "usuario_id"
    t.integer  "calificacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos", :force => true do |t|
    t.string   "nombre"
    t.integer  "campus_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos_profesores", :force => true do |t|
    t.integer  "curso_id"
    t.integer  "profesor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "flags", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "calificacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "calificacion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesores", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido_materno"
    t.string   "apellido_paterno"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
  end

  create_table "universidades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "username"
    t.string   "rol",                                   :default => "Usuario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campus_id"
    t.integer  "universidad_id"
    t.string   "email",                                 :default => "",        :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
