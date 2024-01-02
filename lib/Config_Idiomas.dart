import 'package:flutter/material.dart';


// Borda.
const ShapeBorder bottomBorder = Border(bottom: BorderSide(width: 0.3, color: Colors.black12));

// Configuracoes do idioma.
const List<String> Idiomas = ["Português", "Espanhol", "Inglês"];
Map<String, bool> IdiomasState = {
  Idiomas[0]:true,
  Idiomas[1]:false,
  Idiomas[2]:false,
};


/*  Pagina para configurar
*   o idioma do aplicativo. */
class Configuracoes_Idioma extends StatefulWidget {
  const Configuracoes_Idioma({super.key});

  @override
  State<Configuracoes_Idioma> createState() => _Configuracoes_IdiomaState();
}

class _Configuracoes_IdiomaState extends State<Configuracoes_Idioma> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: const Text('Idiomas', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black, fontSize: 18)),
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
                leading: const Icon(Icons.language_rounded, color: Colors.indigo, size: 25),  // Icone.
                title: Text(Idiomas[0]),
                trailing: SelectButton(idioma: Idiomas[0], updateState: setState),            // SelectButton.
              ),
              ListTile(
                shape: bottomBorder,    // Borda.
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.language_rounded, color: Colors.indigo, size: 25),  // Icone.
                title: Text(Idiomas[1]),
                trailing: SelectButton(idioma: Idiomas[1], updateState: setState),            // SelectButton.
              ),
              ListTile(
                horizontalTitleGap: 0,  // Espacamento do titulo.
                leading: const Icon(Icons.language_rounded, color: Colors.indigo, size: 25),  // Icone.
                title: Text(Idiomas[2]),
                trailing: SelectButton(idioma: Idiomas[2], updateState: setState),            // SelectButton.
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*  CheckBox para selecionar
*   o idioma do aplicativo. */
class SelectButton extends StatefulWidget {
  const SelectButton({super.key, required this.idioma, required this.updateState});
  final String idioma;            // Idioma para selecionar.
  final StateSetter updateState;  // State da pagina para atualizar os CheckBoxs.

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(color: Colors.indigo)),  // Borda.
      value: IdiomasState[widget.idioma]!,  // Configuracao atual do idioma.
      activeColor: Colors.white,            // Cor de fundo do checkbox.
      checkColor: Colors.indigo,            // Cor do checkbox.
      onChanged: (value) {
        if(IdiomasState[widget.idioma] == false){ // CASO: Atualizacao somente se a configuracao nao estiver marcada.
          IdiomasState.forEach((key, valor) {
            if(key != widget.idioma){
              widget.updateState(() { IdiomasState[key] = false; });  // Novo estado da configuracao dos outros idiomas.
            }
            else{
              widget.updateState(() { IdiomasState[key] = !valor; }); // Novo estado da configuracao do idioma selecionado.
            };
          });
        }
      },
    );
  }
}