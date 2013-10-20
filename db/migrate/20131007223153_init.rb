class Init < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string  :email
      t.string :password
      t.string :salt
      t.boolean :admin
      t.timestamps
    end

    User.create :first_name => 'admin',
                :last_name => 'admin',
                :email => 'admin@admin.com',
                :admin => true



    create_table :units do |t|
      t.string :name
      t.integer :scouts_number
      t.string :city
      t.string :type
      t.string :male
      t.boolean :active
      t.string :photo
      t.timestamps
    end

    create_table :districts do |t|
      t.string :name
    end

    districts = ['Bytów', 'Czarna Woda', 'Gdańsk Wrzeszcz-Oliwa', 'Gdańsk Portowa','Gdańsk Przymorze', 'Gdańsk Śródmieście',
    'Gdynia', 'Hel', 'Kartuzy', 'Kościerzyna', 'Kwidzyn', 'Lębork', 'Malbork', 'Miastko', 'Puck', 'Rumia', 'Słupsk',
    'Sopot', 'Stare Pole', 'Starogard Gdański', 'Sztum', 'Tczew', 'Wejcherowo']


    districts.each do |name|
      District.create :name => name
    end

    create_table :events do |t|
     t.string :name
     t.string :start
     t.string :end
     t.integer :km
     t.string :photo
     t.date :date
     t.text :description
     t.timestamps
    end

  end

  def down
    drop_table :users
    drop_table :units
    drop_table :districts
    drop_table :events
  end
end
