# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Job.create(title: 'Software Developer', description: Cicero.paragraphs(5), name: 'Infinum', email: 'jobs@infinum.com', category: 'IT', deadline: '2020-11-15')
Job.create(title: 'Prodavač', description: Cicero.paragraphs(5), name: 'Konzum', email: 'jobs@konzum.com', category: 'Retail', deadline: '2020-10-20')
Job.create(title: 'AWS operator', description: Cicero.paragraphs(5), name: 'FIVE', email: 'jobs@five.com', category: 'IT', deadline: '2020-11-25')

User.create(email: 'aron.belso@gmail.com', password: '123456', first_name: 'Aron', last_name: 'Belsö')