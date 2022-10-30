import 'package:feed/modules/presentation/feed_screen/main.dart';
import 'package:feed/modules/presentation/post_screen/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              label: "Diário",
              icon: Image.asset("assets/icons/mark.png", height: 30, width: 30,)),
          BottomNavigationBarItem(
              label: "Crianças",
              icon: Image.asset("assets/icons/children.png", height: 30, width: 30,)),
          BottomNavigationBarItem(
              label: "Pontos",
              icon: Image.asset("assets/icons/plus.png", height: 30, width: 30,)),
          BottomNavigationBarItem(
              label: "Mensagens",
              icon: Image.asset("assets/icons/chat.png", height: 30, width: 30,)),
          BottomNavigationBarItem(
              label: "Descubrir",
              icon: Image.asset("assets/icons/idea.png", height: 30, width: 30,)),
        ],
      ),
    );
  }
}
