import 'package:flutter/material.dart';
import 'package:velha_guarda/screens/product_screen.dart';
import 'package:velha_guarda/screens/sobre_screen.dart';
import 'package:velha_guarda/tabs/home_tab.dart';
import 'package:velha_guarda/widgets/custom_drawer.dart';


class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          //  floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Produtos", style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductScreen(),
          //  floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Sobre"),
            centerTitle: true,
          ),
          body: SobreScreen(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
