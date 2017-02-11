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
              ingredients: '-.1 pão italino -1/2 xícara (chá) de uva passa branca
                            -.1/2 xícara (chá) de água -2 colheres (chá) de açúcar
                            -.1 peça de queijo gorgonzola',
              procedure: '-. Coloque o pão italiano em uma forma.
                          -. No forno pré-aquecido a 200°C, leve o pão para dourar.
                          -. Enquanto isso, coloque na panela as uvas-passas, água e o açúcar.
                          -. Leve ao fogo até levantar fervura.
                          -. Abaixe o fogo e deixe até a água secar completamente.
                          -. Assim que a água secar, delisgue o fogo e reserve.
                          -. Enquanto isso, retire o pão do forno.
                            -. Assim que ele esfriar, corte o pão em rodelas com 1 dedo de espessura.
                            -. Distribua as rodelas em uma forma e regue-as com azeite. 10. Leve novamente ao forno para dourar.
                            -. Corte o queijo gorgonzola em fatias finas.
                            -. Distribua em cima das torradas de pão italiano.
                            -. Leve novamente ao forno até o queijo derreter.
                            -. Finalize com as uvas passas por cima.
                            -. Sirva em seguida.')

Recipe.create(name: 'Churros',
              people: 4,
              time: 20,
              difficulty: 'easy',
              cuisine: espanhola,
              food_type: sobremesa,
              user: carlos,
              ingredients: '-.1 e 1/2 xícara (chá) de leite
                            -.1/2 xícara (chá) de água
                            -.2 colheres (sopa) de margarina ou manteiga
                            -.2 xícaras (chá) de farinha de trigo
                            -.sal a gosto
                            -.açúcar a gosto
                            -.canela a gosto',
              procedure: '-.Em uma panela, adicione o leite, a água, a manteiga e o sal
                          -.Quando o leite ferver, adicione a farinha de trigo e mexa rápido até a massa soltar do fundo da panela
                          -.Coloque a massa em um saco de confeiteiro com o bico pitanga, depois faça tirinhas com a massa e frite
                          -.Misture a canela e o açúcar, depois passe nos churros fritos')

Recipe.create(name: 'Panqueca rápida',
              people: 2,
              time: 30,
              difficulty: 'easy',
              cuisine: espanhola,
              food_type: jantar,
              user: carlos,
              ingredients: '-.1 xícara (chá) de farinha de trigo
                            -.1 xícara (chá) de leite
                            -.1 ovo
                            -.1 colher (chá) de sal
                            -.1 colher (café) de fermento em pó
                            -.1 colher (sopa) de óleo de canola
                            ',
              procedure: '-.Coloque no liquidificador o leite, o ovo, o sal, o fermento, o óleo e por último a farinha de trigo. Bata tudo muito bem até formar um mistura homogênea.
                          -.Leve ao fogo um frigideira pequena, antiaderente, untada com óleo. Com uma concha vá colocando a massa da panqueca. Cuide para que não fique grossa. A panqueca deve ficar fininha. Deixe dourar de um lado e depois vire para dourar do outro.
                          -.Retire do fogo e vá recheando a seu gosto. Pode ser um guisado de carne com ovos, de frango, de vegetais, de ricota, de palmito ou outro a seu gosto. Pode ser recheada também com goiabada, marmelada, geleia de morango ou outra a seu gosto.
                          -.Antes de servir leve ao micro-ondas ou ao forno convencional por alguns minutos só para aquecer.
                          -.As panquecas salgadas podem ser em regadas com molho de tomate ou mesmo molho branco, fica uma delicia.
                          -.As panquecas doce podem ser regadas com caldas a seu gosto.')

Recipe.create(name: 'Vieiras, maçã verde, shoyu e saquê',
              people: 2,
              time: 30,
              difficulty: 'hard',
              cuisine: japonesa,
              food_type: jantar,
              user: jhony,
              ingredients: '-.4 vieiras
                            -.1 maçã verde
                            -.5g de raspas de yuzu
                            -.20g de katsuobushi
                            -.20g de kombu
                            -.5ml de shoyu
                            -.50g de sagu
                            -.40g de missô branco
                            -.5 flores de nira
                            -.100 ml de saquê mirim
                            -.200ml de água
                            -.10g de manteiga sem sal
                            ',
              procedure: '-.Prepare o molho dashi e tempere com o shoyu.
                          -.Tire lâminas da vieira e da maçã verde.
                          -.Dilua o missô com água e cozinhe o sagu.
                          -.Salteie as flores de nirá com manteiga.
                          -.Monte e sirva bem gelado.')
