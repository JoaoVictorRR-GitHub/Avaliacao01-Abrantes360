import 'package:flutter/material.dart';


// Borda.
const ShapeBorder bottomBorder = Border(bottom: BorderSide(width: 0.3, color: Colors.black12));


/*  Pagina para iniciar
*   sessao no aplicativo. */
class Iniciar_Sessao extends StatelessWidget {
  const Iniciar_Sessao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: const Text('Iniciar sessão', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black, fontSize: 18)),
      ),
      body: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ListTile(
                shape: bottomBorder,    // Borda.
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.login_rounded, color: Colors.indigo, size: 25),       // Icone.
                title: const Text("Autenticação"),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.indigo, size: 25),  // Seta.
                onTap: (){},
              ),
              ListTile(
                shape: bottomBorder,    // Borda.
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.how_to_reg_outlined, color: Colors.indigo, size: 25), // Icone.
                title: const Text("Registro"),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.indigo, size: 25),  // Seta.
                onTap: (){},
              ),
              ListTile(
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.shield_outlined, color: Colors.indigo, size: 25),     // Icone.
                title: const Text("Recuperar palavra-passe"),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.indigo, size: 25),  // Seta.
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}