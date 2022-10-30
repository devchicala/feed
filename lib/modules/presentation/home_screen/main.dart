import 'package:feed/modules/presentation/feed_screen/main.dart';
import 'package:feed/modules/presentation/post_screen/main.dart';
import 'package:feed/shared/themes/appColors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _indiceAtual = 0;

final List<Widget> _telas = [PostScreen(), FeedScreen()];

class _HomeScreenState extends State<HomeScreen> {
  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _indiceAtual == 0 ? _telas[1] : _telas[0],
      backgroundColor: AppColors.grey,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              label: "Diário",
              icon: Icon(Icons.abc)),
          BottomNavigationBarItem(
              label: "Crianças",
              icon: Icon(Icons.child_care)),
          BottomNavigationBarItem(
              label: "Pontos",
              icon: Icon(Icons.add_circle)),
          BottomNavigationBarItem(
              label: "Mensagens",
              icon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              label: "Descubrir",
              icon: Icon(Icons.tips_and_updates)),
        ],
      ),
    );
  }
}
