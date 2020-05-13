class Nutrients {
  String name;
  String weight;
  double percent;
  Nutrients({this.name, this.weight, this.percent});
}

class Recipe{
  String id,imageUrl;
  List<String> steps;
  List<String> ingredients;
  List<Nutrients> nutrients;
  Recipe({this.id,this.imageUrl,this.steps,this.ingredients,this.nutrients});
}
