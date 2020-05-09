import 'package:flutter/material.dart';
import 'package:velha_guarda/screens/details.dart';
import 'package:velha_guarda/util/data.dart';


class DescricaoReceita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body = Container(
      color: Colors.grey[800],
      child: GridView.builder(
          shrinkWrap: false,
          itemCount: Data.recipes.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                recipe: Data.recipes[index],
                              )));
                },
                child: Card(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Hero(
                              tag: Data.recipes[index].id,
                              child: FadeInImage(
                                image:
                                    NetworkImage(Data.recipes[index].imageUrl),
                                fit: BoxFit.cover,
                                placeholder:
                                    AssetImage('images/loading.gif'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            Data.recipes[index].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );

    return Scaffold(
      appBar: (AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.grey[800],
        elevation: 0,
        title: Text('', style: TextStyle(color: Colors.orange)),
        centerTitle: true,
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color:Colors.orange,
            onPressed: () {
              Navigator.of(context).pop();
            }
        ),
      )),
      body: body,
    );
  }
}
