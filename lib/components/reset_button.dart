
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velha_guarda/constants/captions.dart';
import 'package:velha_guarda/screens/carteira_screen.dart';

class ResetButton extends StatefulWidget {
  final Function onTap;
  final decoration;
  final textStyle;

  ResetButton({this.onTap, this.decoration, this.textStyle});

  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  var pressed = false;

  @override
  Widget build(BuildContext context) {
    final captions = Provider.of<Captions>(context);
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        setState(() {
          pressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          pressed = false;
        });
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        SizedBox(
        height: 16.0,
      ),
          FloatingActionButton.extended(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CarteiraScreen()));
          },
        icon: Icon(Icons.save),
        label: Text("Confirmar"),
        backgroundColor: Colors.orange,
      ),
        ],
    ),
    );
  }
}
