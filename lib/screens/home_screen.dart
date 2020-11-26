import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:velha_guarda/screens/product_screen.dart';
import 'package:velha_guarda/screens/sobre_screen.dart';
import 'package:velha_guarda/tabs/home_tab.dart';
import 'package:velha_guarda/widgets/custom_drawer.dart';
import 'package:velha_guarda/screens/bloc_home.dart';


class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  var bloc = BlocHome();

  @override
  void initState() {
    bloc.initOneSignal();
  }

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
