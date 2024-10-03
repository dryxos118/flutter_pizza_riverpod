import 'package:flutter_pizza_riverpod/models/ingredients.dart';
import 'package:flutter_pizza_riverpod/models/pizza.dart';

Ingredient sauce = Ingredient(name: "Sauce tomate");
Ingredient jambon = Ingredient(name: "Jambon");
Ingredient fromage = Ingredient(name: "Fromage");
Ingredient oeuf = Ingredient(name: "Oeuf");
Ingredient champignon = Ingredient(name: "Champignon");
Ingredient olive = Ingredient(name: "Olive");
Ingredient pepperoni = Ingredient(name: "Pepperoni");
Ingredient ananas = Ingredient(name: "Ananas");
Ingredient poivron = Ingredient(name: "Poivron");
Ingredient oignon = Ingredient(name: "Oignon");
Ingredient poulet = Ingredient(name: "Poulet");
Ingredient bacon = Ingredient(name: "Bacon");
Ingredient thon = Ingredient(name: "Thon");
Ingredient mais = Ingredient(name: "Maïs");
Ingredient basilic = Ingredient(name: "Basilic");

List<Pizza> getPizza() {
  List<Pizza> pizzas = [];

  Pizza reine = Pizza(
    name: "Reine",
    price: 5.0,
    isVegan: false,
    ingredients: [sauce, jambon, fromage, oeuf],
  );

  Pizza margherita = Pizza(
    name: "Margherita",
    price: 4.0,
    isVegan: true,
    ingredients: [sauce, fromage, basilic],
  );

  Pizza quatroFormaggi = Pizza(
    name: "Quatro Formaggi",
    price: 6.0,
    isVegan: false,
    ingredients: [sauce, fromage, olive, oeuf],
  );

  Pizza fungi = Pizza(
    name: "Fungi",
    price: 5.5,
    isVegan: false,
    ingredients: [sauce, fromage, champignon],
  );

  Pizza pepperoniPizza = Pizza(
    name: "Pepperoni",
    price: 6.5,
    isVegan: false,
    ingredients: [sauce, fromage, pepperoni],
  );

  Pizza hawaiienne = Pizza(
    name: "Hawaïenne",
    price: 7.0,
    isVegan: false,
    ingredients: [sauce, fromage, jambon, ananas],
  );

  Pizza vegetarienne = Pizza(
    name: "Végétarienne",
    price: 6.0,
    isVegan: true,
    ingredients: [sauce, fromage, champignon, poivron, oignon, olive],
  );

  Pizza pouletBarbecue = Pizza(
    name: "Poulet Barbecue",
    price: 7.5,
    isVegan: false,
    ingredients: [sauce, fromage, poulet, oignon, bacon],
  );

  Pizza thonMais = Pizza(
    name: "Thon et Maïs",
    price: 6.5,
    isVegan: false,
    ingredients: [sauce, fromage, thon, mais, oignon],
  );

  Pizza spicy = Pizza(
    name: "Spicy",
    price: 7.0,
    isVegan: false,
    ingredients: [sauce, fromage, poivron, pepperoni, oignon],
  );

  pizzas = [
    reine,
    spicy,
    thonMais,
    pouletBarbecue,
    vegetarienne,
    hawaiienne,
    pepperoniPizza,
    fungi,
    quatroFormaggi,
    margherita
  ];
  return pizzas;
}
