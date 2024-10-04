import 'package:flutter_pizza_riverpod/models/pizza.dart';

List<Pizza> getPizza() {
  List<Pizza> pizzas = [
    Pizza(
      name: "MARGARITA",
      ingredients: ["Sauce tomate", "fromage", "olives", "origan"],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_158.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "VEGETARIENNE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "aubergines",
        "champignons",
        "tomates fraîches",
        "origan",
        "olives"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_159.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "4 SAISONS",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "champignons",
        "tomates fraîches",
        "poivrons",
        "oignons",
        "origan",
        "olives"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_160.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "REINE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "jambon de dinde",
        "champignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_161.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "BOLOGNAISE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "viande hachée",
        "pommes de terre",
        "oignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_162.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "ORIENTALE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "merguez",
        "poivrons",
        "oignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_163.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "KEBAB",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "émincé de viande kebab",
        "oignons",
        "tomates fraîches"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_164.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "ROYALE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "viande hachée",
        "merguez",
        "poivrons",
        "oignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_165.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "CHORIZO",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "chorizo",
        "poivrons",
        "oignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_166.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "ANDALOUSE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "chorizo",
        "merguez",
        "poivrons",
        "oeuf"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_167.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "MEXICAINE",
      ingredients: ["Sauce tomate", "fromage", "chorizo", "poulet", "oignons"],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_168.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "HAWAIENNE",
      ingredients: ["Sauce tomate", "fromage", "ananas", "jambon de dinde"],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_169.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "CALZONE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "jambon de dinde",
        "champignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_170.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "NAPOLITAINE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "anchois",
        "oignons",
        "câpres",
        "olives"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_171.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "PECHEUR",
      ingredients: ["Sauce tomate", "fromage", "thon", "oignons", "origan"],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_172.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "FRUITS DE MER",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "cocktail de fruits de mer",
        "champignons",
        "origan"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_173.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "4 FROMAGES",
      ingredients: ["Sauce tomate", "fromage", "brie", "chèvre", "bleu"],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_174.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "SUBLIME PEPPER",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "steak de viande",
        "merguez",
        "oignons",
        "sauce poivre"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_212.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "FERMIERE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "potatoes",
        "viande hachée",
        "viande kebab",
        "crème fraîche",
        "persillade"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_204.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      id: "221",
      name: "TEXANE",
      ingredients: [
        "Sauce tomate",
        "fromage",
        "steak de boeuf",
        "chicken tenders",
        "champignons",
        "poivrons",
        "sauce barbecue"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_221.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "SAMOURAI",
      ingredients: [
        "Sauce samourai",
        "crème fraîche",
        "fromage",
        "merguez",
        "viande hachée",
        "oignons",
        "pommes de terre"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_175.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "BARBECUE",
      ingredients: [
        "Sauce barbecue",
        "crème fraîche",
        "fromage",
        "poulet",
        "champignons",
        "oignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_176.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "CHICKEN",
      ingredients: [
        "Crème fraîche",
        "fromage",
        "poulet",
        "pommes de terre",
        "oignons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_177.png",
      priceMedium: 8.90,
      priceLarge: 12.00,
      isVegan: false,
    ),
    Pizza(
      name: "CAMPAGNARDE",
      ingredients: [
        "Crème fraîche",
        "fromage",
        "jambon de dinde",
        "lardons de boeuf",
        "champignons",
        "olives"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_178.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "INDIENNE",
      ingredients: [
        "Sauce curry",
        "crème fraîche",
        "poulet",
        "fromage",
        "oignons",
        "poivrons"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_179.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "NORVEGIENNE",
      ingredients: ["Crème fraîche", "fromage", "saumon fumé", "origan"],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_180.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "TARTIFLETTE",
      ingredients: [
        "Crème fraîche",
        "fromage",
        "lardons de boeuf",
        "reblochon",
        "pommes de terre"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_181.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "CHEVRE-MIEL",
      ingredients: ["Crème fraîche", "fromage", "chèvre", "miel"],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_182.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "FRENCH BURGER",
      ingredients: [
        "Sauce burger",
        "fromage",
        "viande hachée",
        "cornichons",
        "cheddar",
        "sauce barbecue"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_183.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "RACLETTE",
      ingredients: [
        "Crème fraîche",
        "fromage",
        "jambon de dinde",
        "chorizo",
        "raclette",
        "pommes de terre"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_184.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "LA CARBONARA",
      ingredients: [
        "Crème fraîche",
        "fromage",
        "poivre moulu",
        "lardons de boeuf",
        "oignons",
        "oeuf"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_202.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "DAUPHINOISE",
      ingredients: [
        "Crème fraîche",
        "lardons de boeuf",
        "viande hachée",
        "pommes de terre",
        "oignons",
        "persillade"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_203.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
    Pizza(
      name: "SPICY CHICKEN",
      ingredients: [
        "Crème fraîche",
        "poulet",
        "spicy chicken tenders",
        "potatoes",
        "sauce samouraï"
      ],
      imageUrl: "https://www.mozzapizza.fr/produit/1192_214.png",
      priceMedium: 9.50,
      priceLarge: 13.00,
      isVegan: false,
    ),
  ];
  return pizzas;
}
