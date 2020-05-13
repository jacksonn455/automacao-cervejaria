

import 'package:velha_guarda/util/class.dart';

class Data {
  static List<Recipe> recipes = [
    Recipe(
        id: '1',
        imageUrl:
            'http://www.gourmetvirtual.com.br/wp-content/uploads/beers.jpg',
        nutrients: [
          Nutrients(name: 'Calorias', weight: '43g', percent: 0.7),
          Nutrients(name: 'Proteinas', weight: '0,5g', percent: 0.5),
          Nutrients(name: 'Carb', weight: '3,6g', percent: 0.9),
        ],
        steps: [
          'Aqueça entre 22 a 25 litros de água na panela de brassagem até 72ºC; Ao alcançar a temperatura desejada, despeje o malte moído vagarosamente.',

          'Mantenha a temperatura por 68ºC durante 60 minutos. Terminados os 60 minutos, suba a temperatura para 78°C e faça o mash-out e deixe o mosto descansar por 10 minutos.',

          'Faça a recirculação, e transfira o mosto para a panela de fervura. Neste ponto pode-se seguir por dois caminhos: Se o volume de mosto após a filtragem ficar entre 18-20 Litros você deve “lavar” mais o mosto com água quente (a 78ºC) até atingir um volume de 22-24L. Se o volume após a filtragem ficar entre 22-24L não há necessidade de lavagem.',

          'Neste ponto a densidade do mosto deve estar um pouco abaixo da OG desejada. Não se preocupe, pois na fervura o volume será reduzido e a densidade subirá.',

          'Com a mosto filtrado já na panela de brassagem (sem o fundo falso ou bazooca), suba a temperatura até o mosto ferver e deixe o mosto em fervura por 60 minutos.',

          'Após o início da fervura, adicione os lúpulos conforme a receita. Passados 60 minutos da fervura desligue o fogo. Aguarde 5 minutos e faça whirpool  Este processo pode ser melhorado com a adição de uma pastilha de whirfloc 15 minutos antes do fim da fervura). Aguarde 5 minutos para os resíduos decantar. Se você medir a densidade agora ela estará muito próxima do indicado na receita.',

          'Resfrie o mosto  para temperatura abaixo de 30°C, transfira-o para o fermentador e inocule o fermento. Dica: Será melhor para a fermentação, se a levedura for hidratada antes da inoculação. Para hidratá-la, ferver 100 mL de água e deixar esfriar a baixo de 30°C. Despeje o fermento e deixar hidratando por 30 minutos (Você pode fazer isso enquanto ferve o mosto).',

          'Fermente à 22°C por 1 semana ou até a FG estabilizar.',

          'Após a fermentação, retire o fermento do fermentador e inicie a maturação por mais 10 dias em geladeira (por volta de 10ºC). Após a maturação é possível ainda ter um resto de fermento, descarte ele antes de iniciar a etapa de refermentação na garrafa. Pegue o Priming de Açúcar Invertido dos Lamas (1 pote para 20L de cerveja) adicione-o no maturador (sem o fermento, pois você ja purgou o fermento). Homogenize ele com a cerveja, levemente, mexendo. Após isso, é só encher as garrafas e tampar.',

          'Guarde as garrafas de cerveja por 5 a 7 dias (em temperatura ambiente) até formar gás. Depois disso basta colocar as garrafas para gelar e aproveitar.',

        ],
        ingredients: [
              '4,0 kg Malte Pilsen',

              '1,0 kg Malte Caramalt',

              '20 g Lúpulo Columbus – 60 min',

              '10 g Lúpulo Cascade – 5 min',

              '1 sachê Fermento Mangrove Jack´s M44 – US West Coast ou Fermentis US-05',

              ' 1 potinho de Priming',
        ]),
  ];
}
