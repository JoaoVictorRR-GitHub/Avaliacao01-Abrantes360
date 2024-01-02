import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'Drawers.dart';
import 'Destaques.dart';
import 'Categorias.dart';
import 'Janela_Sessao.dart';
import 'Config_Definicoes.dart';
import 'Janela_Notificacao.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),  // Material 2.
      debugShowCheckedModeBanner: false,
      home: const Abrantes360(),
    );
  }
}


/*  Pagina Inicial. */
class Abrantes360 extends StatefulWidget {
  const Abrantes360({Key? key}) : super(key: key);

  @override
  State<Abrantes360> createState() => _Abrantes360State();
}

class _Abrantes360State extends State<Abrantes360> {

  int indexA = 0; // Indice do BottomNavigationBar.
  final GlobalKey<ScaffoldState> _ScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldKey,
      drawer: const Drawer_Abrantes360(), // Drawer.
      appBar: AppBar(
        elevation: 0.5,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: const Text('Olá, Convidado', style: TextStyle(fontWeight: FontWeight.bold,  color: Colors.black, fontSize: 18)),
        leading: IconButton(  // Iniciar sessao.
          icon: const Icon(Icons.person_outline),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Iniciar_Sessao())),
        ),
        actions: [
          IconButton(         // Notificacoes.
            padding: const EdgeInsets.only(right: 15),
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Notificacoes())),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 10.0, left: 10.0),
                  child: Text('Destaques', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Grid_Destaques(),   // Banners de destaque.
            Grid_Categorias(),  // Categorias.
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){ BottomDrawer_Abrantes360(context); },  // Abre o BottomDrawer.
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.star),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(       // BottomNavigationBar.
        activeIndex: indexA,              // Indice do botao.
        icons: navigatorIcones,           // Lista de icones.
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() => indexA = index);
          if(indexA == 0){ _ScaffoldKey.currentState!.openDrawer(); } // Abre o drawer.
          else{ Navigator.of(context).push(MaterialPageRoute(builder: (context) => navigatorPaginas[index])); }
        },
        //other params
      ),
    );
  }
}


/*  Lista de icones do BottomNavigationBar. */
const List<IconData> navigatorIcones = [
  Icons.view_headline_rounded,
  Icons.qr_code_2_rounded,
  Icons.settings_outlined,
  Icons.account_circle_outlined,
];


/*  Paginas de cada botao
*   do BottomNavigationBar. */
const List<Widget> navigatorPaginas = [
  Abrantes360(),
  Iniciar_Sessao(),
  Configuracoes_Definicao(),
  Iniciar_Sessao(),
];