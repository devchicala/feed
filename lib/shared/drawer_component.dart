import 'package:feed/models/navigation_item.dart';
import 'package:feed/shared/themes/appColors.dart';
import 'package:feed/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  Future logoutDialog(BuildContext context) {
    return showDialog(
        builder: (context) {
          return AlertDialog(
            title: Text("Atenção!"),
            content: Text("Terminar sessao?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () async {
                    logout(context);
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirmar')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar')),
            ],
          );
        },
        context: context);
  }

  void logout(BuildContext context) async {
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 220,
              color: AppColors.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 68,
                    width: 68,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset('assets/images/jumbomini.png'),
                  ),
                  Text(
                    "Délcio Franciso",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleBoldHeading,
                  ),
                ],
              ),
            ),
            buildMenuItem(context,
                item: NavigationItem.sincronizacao,
                linkNavigator: 'synchro',
                text: 'Sincronização de fotos',
                icon: Icons.circle),
            buildMenuItem(context,
                item: NavigationItem.conta,
                text: 'Conta',
                linkNavigator: 'account',
                icon: Icons.circle),
            buildMenuItem(context,
                item: NavigationItem.sobre,
                text: 'Sobre',
                linkNavigator: 'about',
                icon: Icons.circle),
            buildMenuItem(context,
                item: NavigationItem.politicas,
                text: 'Políticas',
                linkNavigator: 'politics',
                icon: Icons.circle),
            const SizedBox(
              height: 16,
            ),
            Divider(
              color: Colors.black87,
            ),
            const SizedBox(
              height: 16,
            ),
            ListTile(
              selectedTileColor: Colors.black12,
              leading: Icon(
                Icons.circle,
                color: AppColors.primary,
              ),
              title: Text('Terminar Sessão',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              onTap: () => {
                logoutDialog(context),
              },
            ),
          ],
        ),
      );
}

Widget buildMenuItem(
  BuildContext context, {
  required String text,
  required NavigationItem item,
  required IconData icon,
  final String? linkNavigator,
  final Function? onFinishSession,
}) {
  final color = AppColors.primary;

  return Material(
    color: Colors.transparent,
    child: ListTile(
      selectedTileColor: Colors.black12,
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
      onTap: () => {
        Navigator.of(context).pop(),
        Navigator.pushNamed(context, '/$linkNavigator')
      },
    ),
  );
}
