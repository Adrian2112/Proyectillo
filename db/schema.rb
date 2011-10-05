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

ActiveRecord::Schema.define(:version => 20111005004150) do

  create_table "calificaciones", :force => true do |t|
    t.integer  "puntualidad"
    t.integer  "amigable"
    t.integer  "conocimiento"
    t.integer  "claridad"
    t.integer  "flexibilidad"
    t.float    "promedio"
    t.string   "comentarios"
    t.integer  "profesor_id"
    t.integer  "facilidad"
    t.float    "calificacion_obtenida"
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

  create_table "cursos", :force => true do |t|
    t.string   "nombre"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos_profesores", :id => false, :force => true do |t|
    t.integer  "curso_id"
    t.integer  "profesor_id"
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
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  create_table "universidades", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "rol",            :default => "Usuario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campus_id"
    t.integer  "universidad_id"
  end

end
