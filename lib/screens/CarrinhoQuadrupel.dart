import 'package:flutter/material.dart';
import 'package:velha_guarda/screens/certo_screen.dart';
import 'package:velha_guarda/screens/ok_screen.dart';

class CarrinhoQuadrupel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Quadrupel', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: ListView(children: <Widget>[
        Card(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                width: 150.0,
                child: Image.asset(
                  "images/packquadrup.png",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Quadrupel",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17.0),
                      ),
                      Text(
                        "Tamanho: Longneck",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "R\$ 13,50",
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.orange,
                            onPressed: () {},
                          ),
                          Text("1"),
                          IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.orange,
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    margin:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: ExpansionTile(
                      title: Text(
                        "Cálcular Frete",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                      leading: Icon(Icons.location_on, color: Colors.orange),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Digite seu CEP"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Card(
                    margin:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: ExpansionTile(
                      title: Text(
                        "Cupom de Desconto",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                      leading: Icon(Icons.card_giftcard, color: Colors.orange),
                      trailing: Icon(Icons.add, color: Colors.orange),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Digite seu cupom"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Card(
                    margin:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              "Resumo do Pedido",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Subtotal"),
                                Text("R\$ 13,50")
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Desconto"),
                                Text("R\$ 0,00")
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Entrega"),
                                Text("R\$ 15,00")
                              ],
                            ),
                            Divider(),
                            SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "R\$ 28,50",
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 16.0),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            RaisedButton(
                                child: Text("Finalizar Pedido"),
                                textColor: Colors.white,
                                color: Colors.orange,
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => CertoScreen()));
                                }
                            )
                          ],
                        )),
                  ),
                ]),
          ),
        )
      ]),
    );
  }
}
