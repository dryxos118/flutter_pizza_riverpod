import 'package:flutter_pizza_riverpod/models/pizza.dart';

List<Pizza> getPizza() {
  List<Pizza> pizzas = [
    Pizza(
        name: "Samourai",
        ingredients: [
          "Sauce samourai",
          "Crème fraîche",
          "Fromage",
          "Merguez",
          "Pommes de terre"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_175.png",
        priceMedium: 9.50,
        priceLarge: 13.00,
        isVegan: false),
    Pizza(
        name: "Barbecue",
        ingredients: [
          "Sauce barbecue",
          "Crème fraîche",
          "Fromage",
          "Poulet",
          "Oignons"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_176.png",
        priceMedium: 8.90,
        priceLarge: 12.00,
        isVegan: false),
    Pizza(
        name: "Chicken",
        ingredients: ["Crème fraîche", "Fromage", "Poulet", "Pommes de terre"],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_177.png",
        priceMedium: 8.90,
        priceLarge: 12.00,
        isVegan: false),
    Pizza(
        name: "Campagnarde",
        ingredients: [
          "Crème fraîche",
          "Fromage",
          "Jambon de dinde",
          "Lardons de dinde",
          "Pommes de terre"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_178.png",
        priceMedium: 9.50,
        priceLarge: 13.00,
        isVegan: false),
    Pizza(
        name: "Indienne",
        ingredients: [
          "Sauce curry",
          "Crème fraîche",
          "Poulet",
          "Fromage",
          "Oignons"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_179.png",
        priceMedium: 9.50,
        priceLarge: 13.00,
        isVegan: false),
    Pizza(
        name: "Margarita",
        ingredients: ["Sauce tomate", "Fromage", "Olives", "Origan"],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_158.png",
        priceLarge: 12.00,
        priceMedium: 8.90,
        isVegan: false),
    Pizza(
        name: "Végétarienne",
        ingredients: [
          "Sauce tomate",
          "Fromage",
          "Aubergines",
          "Champignons",
          "Oignons",
          "Poivrons"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_159.png",
        priceLarge: 12.00,
        priceMedium: 8.90,
        isVegan: false),
    Pizza(
        name: "4 Saisons",
        ingredients: [
          "Sauce tomate",
          "Fromage",
          "Champignons",
          "Tomates fraîches",
          "Olives"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_160.png",
        priceLarge: 12.00,
        priceMedium: 8.90,
        isVegan: false),
    Pizza(
        name: "Reine",
        ingredients: [
          "Sauce tomate",
          "Fromage",
          "Jambon de dinde",
          "Champignons"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_161.png",
        priceLarge: 12.00,
        priceMedium: 8.90,
        isVegan: false),
    Pizza(
        name: "Bolognaise",
        ingredients: [
          "Sauce tomate",
          "Fromage",
          "Viande hachée",
          "Pommes de terre"
        ],
        imageUrl: "https://www.mozzapizza.fr/produit/1192_162.png",
        priceLarge: 12.00,
        priceMedium: 8.90,
        isVegan: false)
  ];
  return pizzas;
}
