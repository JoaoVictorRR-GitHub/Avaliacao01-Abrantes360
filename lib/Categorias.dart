import 'package:flutter/material.dart';
import 'main.dart';


/*  Classe de categorias. */
class Categorias {
  String Categoria; // Nome da categoria.
  Icon   Icone;     // Icone que representa a categoria.
  Widget Pagina;    // Pagina para onde a categoria ira levar.

  Categorias(this.Categoria, this.Icone, this.Pagina);
}


/*  Lista de categorias.  */
List<Categorias> lstCategorias = [
  Categorias("Serviços",    const Icon(Icons.list,                    size: 30, color: Colors.indigo), const Abrantes360()),
  Categorias("Eventos",     const Icon(Icons.calendar_month_outlined, size: 30, color: Colors.indigo), const Abrantes360()),
  Categorias("Ocorrências", const Icon(Icons.warning_amber,           size: 30, color: Colors.indigo), const Abrantes360()),
  Categorias("Turismo",     const Icon(Icons.map_outlined,            size: 30, color: Colors.indigo), const Abrantes360()),
];



/*  Grid de categorias. */
class Grid_Categorias extends StatelessWidget {
  const Grid_Categorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,    // Numero de colunas.
        childAspectRatio: 2,  // Proporcao do destaque em relacao a tela.
        mainAxisSpacing: 10,  // Espacamento vertical.
        crossAxisSpacing: 10, // Espacamento horizontal.
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        children: List.generate(lstCategorias.length, (indexC){
          return GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => lstCategorias[indexC].Pagina)),
            child: Card(
              elevation: 0.5,
              margin: const EdgeInsets.symmetric(vertical: 0.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Borda.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lstCategorias[indexC].Icone,
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(lstCategorias[indexC].Categoria),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}