import 'package:flutter/material.dart';
import 'Categorias.dart';
import 'main.dart';


// Borda.
const ShapeBorder bottomBorder01 = Border(bottom: BorderSide(width: 2, color: Colors.black12));
const ShapeBorder bottomBorder02 = Border(bottom: BorderSide(width: 0.3, color: Colors.black12));


/*  Drawer do aplicativo. */
class Drawer_Abrantes360 extends StatelessWidget {
  const Drawer_Abrantes360({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 15),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListView(
            padding:const EdgeInsets.all(0),
            children: [
              ListTile(                 // Titulo.
                shape: bottomBorder01,  // Borda.
                title: const Text("   Navegação", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24)),
                trailing: FloatingActionButton.small(
                  backgroundColor: Colors.black,
                  child: const Icon(Icons.close_rounded),
                  onPressed: (){ Navigator.of(context).pop(); },  // Botao.
                ),
              ),
              ListView.builder(   // Lista de categorias do drawer.
                padding: const EdgeInsets.all(15),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: lstDrawer.length,
                itemBuilder: (context, index){
                  return ListTile(
                    shape: bottomBorder02,            // Borda.
                    horizontalTitleGap: 0,            // Espacamento do titulo.
                    leading: lstDrawer[index].Icone,  // Icone.
                    title: Text(lstDrawer[index].Categoria, style: const TextStyle(fontSize: 16)),
                    onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => lstDrawer[index].Pagina)); },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*  Lista de categorias do Drawer.  */
List<Categorias> lstDrawer = [
  Categorias("Eventos",               const Icon(Icons.calendar_month_rounded,    size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Turismo",               const Icon(Icons.map_rounded,               size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Serviços",              const Icon(Icons.list_rounded,              size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Ocorrências",           const Icon(Icons.warning_amber_rounded,     size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Violência Doméstica",   const Icon(Icons.not_interested_rounded,    size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Processos",             const Icon(Icons.list_alt_rounded,          size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Proteção Civil",        const Icon(Icons.security_rounded,          size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Definições",            const Icon(Icons.settings_outlined,         size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Trasmissões",           const Icon(Icons.video_camera_back_rounded, size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Município de Abrantes", const Icon(Icons.apartment_rounded,         size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Contactos",             const Icon(Icons.phone_rounded,             size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Acerca do Abrantes360", const Icon(Icons.info_outline_rounded,      size: 25, color: Colors.indigo), const Abrantes360()),
  Categorias("Terminar Sessão",       const Icon(Icons.exit_to_app_outlined,      size: 25, color: Colors.indigo), const Abrantes360()),
];



/*  BottomDrawer do aplicativo. */
Future BottomDrawer_Abrantes360 (BuildContext context) async{

  const Radius bordaRadius = Radius.circular(20);

  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: bordaRadius, topRight: bordaRadius)),
    constraints: const BoxConstraints(maxHeight: 220),  // Tamanho do BottomDrawer.
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: [
          const ListTile(
            shape: bottomBorder02,                        // Borda.
            title: Icon(Icons.star, color: Colors.amber), // Titulo.
          ),
          Container(  // Mensagem.
            padding: const EdgeInsets.all(20),
            child: const Text("Ainda não tem favoritos. Na lista dos serviços "
                "basta tocar duas vezes no serviço que pretende marcar como favorito. "
                "Para remover basta pressionar durante alguns segundos.", textAlign: TextAlign.justify, style: TextStyle(fontSize: 16)),
          ),
        ],
      );
    },
  );
}