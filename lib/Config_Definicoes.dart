import 'package:flutter/material.dart';
import 'Config_Notificacoes.dart';
import 'Config_Idiomas.dart';


// Borda.
const ShapeBorder bottomBorder = Border(bottom: BorderSide(width: 0.3, color: Colors.black12));


/*  Pagina para configurar as
*   definicoes do aplicativo. */
class Configuracoes_Definicao extends StatelessWidget {
  const Configuracoes_Definicao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: const Text('Definições', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black, fontSize: 18)),
      ),
      body: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 145,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ListTile(
                shape: bottomBorder,    // Borda.
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.notifications_none_rounded, color: Colors.indigo, size: 25),  // Icone.
                title: const Text("Notificações"),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.indigo, size: 25),          // Seta.
                onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Configuracoes_Notificacao())); },
              ),
              ListTile(
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.language_rounded, color: Colors.indigo, size: 25),            // Icone.
                title: const Text("Idiomas"),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.indigo, size: 25),          // Seta.
                onTap: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Configuracoes_Idioma())); },
              ),
            ],
          ),
        ),
      ),
    );
  }
}