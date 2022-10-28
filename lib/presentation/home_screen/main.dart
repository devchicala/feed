import 'package:feed/presentation/feed_screen/main.dart';
import 'package:feed/presentation/post_screen/main.dart';
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
              icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
                  color: _indiceAtual == 0 ? Colors.blue : null)),
          BottomNavigationBarItem(
              label: "Crianças",
              icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
                  color: _indiceAtual == 1 ? Colors.blue : null)),
          BottomNavigationBarItem(
              label: "Pontos",
              icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
                  color: _indiceAtual == 2 ? Colors.blue : null)),
          BottomNavigationBarItem(
              label: "Mensagens",
              icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
                  color: _indiceAtual == 3 ? Colors.blue : null)),
          BottomNavigationBarItem(
              label: "Descubrir",
              icon: SvgPicture.asset("assets/svg/ic_tab_feed_default.svg",
                  color: _indiceAtual == 4 ? Colors.blue : null)),
        ],
      ),
    );
  }
}
