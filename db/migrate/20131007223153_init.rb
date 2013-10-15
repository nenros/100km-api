class Init < ActiveRecord::Migration
  def up
    create_table :uzytkownicy do |t|
      t.string :imie
      t.string :nazwisko


    end
  end

  def down
  end
end
