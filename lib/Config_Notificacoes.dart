import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


// Borda.
const ShapeBorder bottomBorder = Border(bottom: BorderSide(width: 0.3, color: Colors.black12));

// Configuracoes de notificaco.
const List<String> Notificacoes = ["Gerais", "Desporto", "Cultura", "Proteção Civil"];
Map<String, bool> NotificacoesState = {
  Notificacoes[0]:false,
  Notificacoes[1]:false,
  Notificacoes[2]:false,
  Notificacoes[3]:false,
};


/*  Pagina para configurar as
*   notificacoes do aplicativo. */
class Configuracoes_Notificacao extends StatelessWidget {
  const Configuracoes_Notificacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: const Text('Notificações', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black, fontSize: 18)),
      ),
      body: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 255,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ListTile(
                shape: bottomBorder,    // Borda.
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.apartment_rounded, color: Colors.indigo, size: 25),       // Icone.
                title: Text(Notificacoes[0]),
                trailing: SwitchButton(notificacao: Notificacoes[0]),                               // Botao ON/OFF.
              ),
              ListTile(
                shape: bottomBorder,    // Borda.
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.flag_rounded, color: Colors.indigo, size: 25),            // Icone.
                title: Text(Notificacoes[1]),
                trailing: SwitchButton(notificacao: Notificacoes[1]),                               // Botao ON/OFF.
              ),
              ListTile(
                shape: bottomBorder,    // Borda.
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.theater_comedy_outlined, color: Colors.indigo, size: 25), // Icone.
                title: Text(Notificacoes[2]),
                trailing: SwitchButton(notificacao: Notificacoes[2]),                               // Botao ON/OFF.
              ),
              ListTile(
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.warning_amber_rounded, color: Colors.indigo, size: 25),   // Icone.
                title: Text(Notificacoes[3]),
                trailing: SwitchButton(notificacao: Notificacoes[3]),                               // Botao ON/OFF.
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*  Botao ON/OFF para ativar/desativar
*   uma configuracao de notificacao.  */
class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key, required this.notificacao});
  final String notificacao; // Notificacao para selecionar.

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      trackColor: Colors.grey,
      activeColor: Colors.indigo,                     // Cor do botao ativo.
      value: NotificacoesState[widget.notificacao]!,  // Configuracao atual da notificacao.
      onChanged: (bool value) {
        setState(() {                                 // Novo estado da notificacao.
          NotificacoesState[widget.notificacao] = !NotificacoesState[widget.notificacao]!;
        });
      },
    );
  }
}