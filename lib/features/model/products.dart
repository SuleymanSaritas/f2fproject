class Products {
  int id;
  String name;
  int price;
  String explanation;

  Products(
    this.name,
    this.explanation,
    this.price,
  );
  Products.withID(
    this.id,
    this.name,
    this.explanation,
    this.price,
  );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    map['explanation'] = explanation;
    map['price'] = price;
    return map;
  }

  Products.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    explanation = map['explanation'];
    price = map['price'];
  }

  String toString() {
    return 'Products{id: $id, name: $name, explanation: $explanation, price: $price}';
  }
}