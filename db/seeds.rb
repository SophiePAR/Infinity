# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'cleaning db'

Order.destroy_all
UserTombstone.destroy_all
User.destroy_all
Tombstone.destroy_all
Prestation.destroy_all

puts 'creating users'
user1 = User.create!(email: 'alex@mail.com', password: 'azerty', first_name: 'Alex', last_name: 'Cazacu', phone:'0680808080');
user2 = User.create!(email: 'franci@mail.com', password: 'azerty', first_name: 'Franci', last_name: 'Lalane', phone:'0610101010');
user3 = User.create!(email: 'sophie@mail.com', password: 'azerty', first_name: 'Sophie', last_name: 'Parisot', phone:'0620202020');
user4 = User.create!(email: 'vanessa@mail.com', password: 'azerty', first_name: 'Vanessa', last_name: 'Reynes', phone:'0630303030');

tombe1 = Tombstone.create!(first_name: 'Charles', last_name: 'Holle', birth_date: '10/11/1989', death_date: '12/11/2022', latitude:'48.862725', longitude:'2.287592');
tombe2 = Tombstone.create!(first_name: 'henri', last_name: 'Chalot', birth_date: '10/10/1945', death_date: '12/12/2000', latitude:'30.862725', longitude:'1.287592');
tombe3 = Tombstone.create!(first_name: 'Michelle', last_name: 'Tourny', birth_date: '09/01/1950', death_date: '01/02/2010', latitude:'20.862725', longitude:'2.287592');
tombe4 = Tombstone.create!(first_name: 'Gabrielle', last_name: 'Solisse', birth_date: '30/03/1946', death_date: '04/03/1990', latitude:'48.862725', longitude:'1.287592');

prestation0 = Prestation.create!(title: 'Arrosage', price: '', content: '');
prestation1 = Prestation.create!(title: 'Photographie', price: '', content: '');
prestation2 = Prestation.create!(title: 'Bouquet de fleurs', price: '', content: 'bouquet composé de 3 fleurs');
prestation3 = Prestation.create!(title: 'Entretien de la tombe', price: '', content: '');
prestation4 = Prestation.create!(title: 'Autres', price: '', content: '');

user_tombstone1 = UserTombstone.create(user_id: user1.id, tombstone_id: tombe2.id);
user_tombstone2 = UserTombstone.create(user_id: user2.id, tombstone_id: tombe1.id);
user_tombstone3 = UserTombstone.create(user_id: user3.id, tombstone_id: tombe4.id);
user_tombstone4 = UserTombstone.create(user_id: user4.id, tombstone_id: tombe3.id);

order1 = Order.create!(review: '', rating: nil, date: '29/11/2022', tombstone_id: tombe3.id, user_tombstone_id: user_tombstone4.id);
order2 = Order.create!(review: '', rating: nil, date: '26/11/2022', tombstone_id: tombe2.id, user_tombstone_id: user_tombstone1.id);
order3 = Order.create!(review: 'Bravo!', rating: 4, date: '27/11/2022', tombstone_id: tombe4.id, user_tombstone_id: user_tombstone3.id);
# order4 = Order.create!(review: 'Super!', rating: 5, date: '24/11/2022', user_id: user1.id, tombstone_id: tombe1.id);

OrderItem.create!(details: '', price: 30, prestation_id: prestation1.id, order_id: order1.id);
OrderItem.create!(details: 'Fleurs bleues', price: 20, prestation_id: prestation2.id, order_id: order3.id);
OrderItem.create!(details: '', price: 60, prestation_id: prestation3.id, order_id: order2.id);

puts 'all is good !'
