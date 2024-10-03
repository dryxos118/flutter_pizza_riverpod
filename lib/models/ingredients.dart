class Ingredient {
  String name;

  Ingredient({required this.name});

  // Méthode pour créer un objet Ingredient depuis Firestore
  factory Ingredient.fromFirestore(data) {
    return Ingredient(name: data);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  static Ingredient fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['name'],
    );
  }
}
