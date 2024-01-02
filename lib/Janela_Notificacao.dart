import 'package:flutter/material.dart';
import 'Config_Notificacoes.dart';


// Indice atual do filtro de notificacoes.
int filtroIndex = 0;


/*  Pagina de notificacoes. */
class Notificacoes extends StatefulWidget {
  const Notificacoes({super.key});

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: const Text('Notificações', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black, fontSize: 18)),
        actions: [
          IconButton( // Filtro de notificacoes.
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () { Filtro(context, filtroIndex); },
          ),
          IconButton( // Configuracao de notificacoes.
            padding: const EdgeInsets.only(right: 15),
            icon: const Icon(Icons.format_list_bulleted),
            onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Configuracoes_Notificacao())),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("imagens/Notificacoes.png"),
            const Text("Sem resultados!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("Não existem resultados para o\npretendido", textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}



/*  Metodo para filtrar as notificacoes.  */
Future Filtro (BuildContext context, int indice) async{

  // Nome dos filtros.
  const List<String> filtrosNome = ['Todos', 'Geral', 'Desporto', 'Cultura'];

  await showDialog(context: context, builder: (context){
    return StatefulBuilder(builder: (context, StateSetter setState) {
      return SimpleDialog(
        title: const Text('Filtrar Categorias'),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(                // Lista de filtros.
              shrinkWrap: true,
              itemCount: filtrosNome.length,
              itemBuilder: (context, index) {
                return RadioListTile(
                  value: index,                     // Valor do filtro.
                  groupValue: filtroIndex,          // Indice atual do filtro.
                  title: Text(filtrosNome[index]),  // Nome do filtro.
                  onChanged: (indice) {             // Novo indice do filtro.
                    setState(() { filtroIndex = indice!; });
                  },
                );
              },
            ),
          ),
        ],
      );
    });
  });

  // Programar filtros.;
}