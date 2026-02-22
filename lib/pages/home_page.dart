import 'package:calculadora_imc/pages/apresentacao_page.dart';
import 'package:calculadora_imc/pages/lista_registro_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController(initialPage: 0);
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    pageIdx = value;
                  });
                },
                children: [
                  ApresentacaoPage(),
                  ListRegistroPage(),
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: pageIdx,
              items: [
                BottomNavigationBarItem(
                  label: "Informações",
                  icon: Icon(Icons.description_sharp),
                ),
                BottomNavigationBarItem(
                  label: "Registro",
                  icon: Icon(Icons.app_registration)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
