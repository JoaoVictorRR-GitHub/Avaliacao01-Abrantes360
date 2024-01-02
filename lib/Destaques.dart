import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'main.dart';


/*  Classe de eventos em destaque.  */
class Destaques {
  String Evento;  // Nome do evento.
  String Data;    // Data do evento.
  String Hora;    // Hora do evento.
  String Imagem;  // Imagem sobre o evento.
  Widget Pagina;  // Pagina para onde o destaque ira levar.

  Destaques(this.Evento, this.Data, this.Hora, this.Imagem, this.Pagina);
}


/*  Lista de eventos em destaque. */
List<Destaques> lstDestaques = [
  Destaques("Autarquias Transição Digital",               "21/09/2023", "09:00", "imagens/Destaque01.png", const Abrantes360()),
  Destaques("Meio - para andar no Médio Tejo",            "22/09/2023", "00:00", "imagens/Destaque02.png", const Abrantes360()),
  Destaques("XXI Feira Nacional de Doçaria Tradicional",  "20/10/2023", "17:00", "imagens/Destaque03.jpg", const Abrantes360()),
];



/*  Grid de eventos em destaque.  */
class Grid_Destaques extends StatelessWidget {
  const Grid_Destaques({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.6,
        viewportFraction: 1,
        disableCenter: true,
        enableInfiniteScroll: false,
      ),
      items: lstDestaques.map((Destaque){
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Destaque.Pagina)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(right: 5, left: 5),
              padding: const EdgeInsets.only(top: 160.0, left: 10),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Destaque.Imagem), fit: BoxFit.fill, opacity: 0.8),
                borderRadius: BorderRadius.circular(15), color: Colors.black,
              ),
              child: Opacity(
                opacity: 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Destaque.Evento, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("${Destaque.Data} ${Destaque.Hora}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white70)),
                  ],
                ),
              ),
            ),
          );
        });
      },
      ).toList(),
    );
  }
}