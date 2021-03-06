# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  {first_name: 'Peter', last_name: 'Lee', dob: '1988-08-08', phone_number: '0121234567', nric: '880808-10-1457', email: 'peterlee@gmail.com', password: 'qweqwe11'},
  {first_name: 'Jane', last_name: 'Lee', dob: '1988-08-07', phone_number: '0131234567', nric: '880807-14-1450', email: 'janelee@gmail.com', password: 'qweqwe11'},
  {first_name: 'Rock', last_name: 'Lee', dob: '1988-08-06', phone_number: '0141234567', nric: '880807-10-3457', email: 'rocklee@gmail.com', password: 'qweqwe11'},
])

agents = Agent.create!([
  {first_name: 'Shawn', last_name: 'Tan', dob: '1994-07-08', phone_number: '01111234567', nric: '940708-10-3457', email: 'shawntan@gmail.com', password: 'qweqwe11', ren_no: '00001', agency_name: 'A126'},
  {first_name: 'Jack', last_name: 'Khoo', dob: '1994-06-07', phone_number: '0161234567', nric: '940607-14-1111', email: 'jackkhoo@gmail.com', password: 'qweqwe11', ren_no: '00002', agency_name: 'A128'},
  {first_name: 'Wing', last_name: 'Chee', dob: '1994-05-06', phone_number: '0181234567', nric: '940506-10-2227', email: 'wingchee@gmail.com', password: 'qweqwe11', ren_no: '00003', agency_name: 'A130'},
])

user_ads_data = [
  {
    property_name: 'UNO Promenade, Sungai Besi',
    price: 467500,
    ad_type: 'Sale'
  },
  {
    property_name: 'LI VILLAS, PETALING JAYA',
    price: 230000,
    ad_type: 'Sale'
  },
  {
    property_name: 'BANDAR PUNCAK ALAM, KUALA SELANGOR',
    price: 4000,
    ad_type: 'Rent'
  }
]

agent_ads_data = [
  {
    property_name: 'TROPIKA KEMENSAH, KEMENSAH',
    price: 267500,
    ad_type: 'Sale'
  },
  {
    property_name: 'IRIS TROPIKA, SHAH ALAM',
    price: 668000,
    ad_type: 'Sale'
  },
  {
    property_name: 'JALAN EQUINE, EQUINE PARK',
    price: 5000,
    ad_type: 'Rent'
  }
]

arr = []

agents.each_with_index do |agent, index|
  al = agent.ads.create!(agent_ads_data[index])
  arr << al.id
end

user_inq_data = [
  {
    ad_id: arr[0],
    email: 'peterlee@gmail.com',
    contact: '0121234567',
    name: 'Peter'
  },
  {
    ad_id: arr[1],
    email: 'janelee@gmail.com',
    contact: '0131234567',
    name: 'Jane'
  },
  {
    ad_id: arr[2],
    email: 'rocklee@gmail.com',
    contact: '0141234567',
    name: 'Rock'
  }
]

users.each_with_index do |user, index|
  user.ads.create!(user_ads_data[index])
  user.inquiries.create!(user_inq_data[index])
end
