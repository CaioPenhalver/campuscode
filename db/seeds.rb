# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Users
admin = Admin.create(name: 'Caio', email:'caio@gmail.com', password: '112628')
renata = Ordinary.create(name: 'Renata', email:'renata@gmail.com', password: '112628')
carlos = Ordinary.create(name: 'Carlos', email:'carlos@gmail.com', password: '112628')
jhony = Ordinary.create(name: 'Jhony', email:'jhony@gmail.com', password: '112628')

#cuisines
italiana = Cuisine.create(name: 'Italiana')
espanhola = Cuisine.create(name: 'Espanhola')
francesa = Cuisine.create(name: 'Francesa')
japonesa = Cuisine.create(name: 'Japonesa')

#food_type
lanche = FoodType.create(name: 'Lanche')
sobremesa = FoodType.create(name: 'Sobremesa')
jantar = FoodType.create(name: 'Jantar')

#recipes
Recipe.create(name: 'Bruschetta de Gorgonzola',
              people: 5,
              time: 35,
              difficulty: 'easy',
              cuisine: italiana,
              food_type: jantar,
              user: renata,
              ingredients: '-1 pão italino -1/2 xícara (chá) de uva passa branca
                            -1/2 xícara (chá) de água -2 colheres (chá) de açúcar
                            -1 peça de queijo gorgonzola',
              procedure: '1. Coloque o pão italiano em uma forma.
                          2. No forno pré-aquecido a 200°C, leve o pão para dourar.
                          3. Enquanto isso, coloque na panela as uvas-passas, água e o açúcar.
                          4. Leve ao fogo até levantar fervura.
                          5. Abaixe o fogo e deixe até a água secar completamente.
                          6. Assim que a água secar, delisgue o fogo e reserve.
                          7. Enquanto isso, retire o pão do forno.
                            8. Assim que ele esfriar, corte o pão em rodelas com 1 dedo de espessura.
                            9. Distribua as rodelas em uma forma e regue-as com azeite. 10. Leve novamente ao forno para dourar.
                            11. Corte o queijo gorgonzola em fatias finas.
                            12. Distribua em cima das torradas de pão italiano.
                            13. Leve novamente ao forno até o queijo derreter.
                            14. Finalize com as uvas passas por cima.
                            15. Sirva em seguida.')
