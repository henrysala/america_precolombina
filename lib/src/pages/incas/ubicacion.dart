import 'package:flutter/material.dart';

class IncasUbicacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ubicacion de los Incas')),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [_cardUbicacion(), _cardGobernante(), _cardConstrucciones()],
      ),
    );
  }

  Widget _cardUbicacion() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          
          ListTile(
            title: Text('Ubicación del Imperio Inca'),
            contentPadding: EdgeInsets.all(20.0),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
            'El imperio Inca surgió en el Valle de Cuzco con el establecimiento allí de un grupo étnico que emigró hacia el año 1100 a.C, posiblemente proveniente del altiplano de Bolivia.'
            +'El imperio Inca ocupó lo que actualmente es Perú, Ecuador, Colombia, el norte y centro de Chile, el oeste de Bolivia y el noreste de Argentina.\n',
            )
          ),
          FadeInImage(
              image: NetworkImage(
                  'https://enciclopediadehistoria.com/wp-content/uploads/2019/05/cultura-inca.jpg'),
              placeholder: AssetImage('assets/giphy.gif'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 350.0,
              width: 360.0,
              fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(20),
            child : Text(
              'Los Incas construyeron poderoso imperio. El Imperio Incaico logró su mayor expansión territorial a fines del siglo XV. Esto lo lograron al dominar '
              +' – mediante guerras de conquista- a los pueblos de otras zonas. El imperio (Tahuantisuyo) estaba dividido en cuatro regiones. Cada región, a su vez, se subdividía en provincias.\n\n'
            + 'Al frente del Imperio estaba el Inca o emperador. En una segunda línea de mando, estaban los gobernadores o curacas, que dirigían las zonas conquistadas.\n\n'
            + 'Al morir el Inca, los gobernadores de las cuatro regiones se reunían en un consejo. La función del consejo era designar al sucesor entre los hijos legítimos del Inca.',
            )
          ),
        ],
      ),
    );
  }

  Widget _cardGobernante() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          ListTile(
            title: Text('Pachacútec\n'),
            //subtitle: Text(),
          ),
          FadeInImage(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/PachacutecIXinca.jpg/245px-PachacutecIXinca.jpg'),
              placeholder: AssetImage('assets/giphy.gif'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 300.0,
              width: 360.0,
              fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Unos de los gobernantes incas más destacados.'
              +'Como parte de su visión de estadista y caudillo guerrero, conquistó muchas etnias y estados, destacando su conquista del Collao, '
              + 'que acrecentó el prestigio de los incas y particularmente de Pachacútec, quien por la notable expansión de sus dominios fue considerado un excepcional líder, '
              + ' dando vida a historias épicas e himnos gloriosos en tributo a sus hazañas. Numerosos curacas no dudaban en reconocer sus destrezas e identificarlo'
              + 'como Hijo del Sol.'
              )
            ),
          
        ],
      ),
    );
  }

  Widget _cardConstrucciones() {
    return Card(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          ListTile(
            title: Text('Construcciones importantes'),
            //subtitle: Text(),
          ),
          ListTile(
            title: Text('\nMachu Picchu'),
          ),
          FadeInImage(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Peru_Machu_Picchu_Sunrise_2.jpg/800px-Peru_Machu_Picchu_Sunrise_2.jpg'),
              placeholder: AssetImage('assets/giphy.gif'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 300.0,
              width: 360.0,
              fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Machu Picchu ha sido por mucho tiempo uno de los más inquietantes enigmas del pasado incaico. Se ubica a algunos cientos de metros sobre la margen izquierda del río Vilcanota o Urubamba.'
              )
            ),
          ListTile(
            title: Text('\nPisac'),
          ),
          FadeInImage(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/a/ad/Ollantaytambo.jpg'),
              placeholder: AssetImage('assets/giphy.gif'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 300.0,
              width: 360.0,
              fit: BoxFit.cover),
            Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Písac (también Pisaq) está ubicado a 33 km de la ciudad del Cuzco. Su sitio arqueológico es uno de los más importantes del Valle Sagrado de los Incas. La arquitectura de Písac es mestiza, construida sobre restos indígenas por el virrey Francisco de Toledo.'
              )
            ),
        ],
      ),
    );
  }
}
