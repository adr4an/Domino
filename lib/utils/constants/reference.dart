import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/images/image_strings.dart';

class TReference {
  TReference._();

  static const categories = [
    'All',
    'Pizza',
    'Burgers',
    'Sides',
    'Drinks',
    'Desserts',
  ];

  static const List<Map<String, String>> categoryItems = [
    {'label': 'Best', 'image': TIconString.best},
    {'label': 'Pizza', 'image': TIconString.pizza},
    {'label': 'Dessert', 'image': TIconString.dessert},
    {'label': 'Coffee', 'image': TIconString.coffee},
    {'label': 'Best', 'image': TIconString.best},
    {'label': 'Pizza', 'image': TIconString.pizza},
  ];

  static const List<Map<String, Object>> products = [
    {
      'imageUrl': TImageString.pizzaProdcut2,
      'calories': '650',
      'name': 'Pepperoni Pizza',
      'description': 'Classic pizza topped with pepperoni and mozzarella.',
      'price': '279.00',
      'rating': 4.5,
      'deliveryTime': '15 min',
    },
    {
      'imageUrl': TImageString.pizzaProdcut1,
      'calories': '590',
      'name': 'Chicken Mushroom Pizza',
      'description': 'Creamy mushroom pizza with tender grilled chicken.',
      'price': '299.00',
      'rating': 4.5,
      'deliveryTime': '20 min',
    },
    {
      'imageUrl': TImageString.pizzaProduct3,
      'calories': '480',
      'name': 'Margherita Pizza',
      'description': 'Fresh tomato, basil, and melted mozzarella cheese.',
      'price': '249.00',
      'rating': 4.5,
      'deliveryTime': '15 min',
    },
  ];

  static const List<Map<String, Object>> pendingOrders = [
    {
      'items': [
        {
          'imageUrl': TImageString.pizzaProdcut2,
          'name': 'Pepperoni Pizza',
          'price': '279.00',
          'quantity': 1,
        },
      ],
    },
    {
      'items': [
        {
          'imageUrl': TImageString.pizzaProdcut1,
          'name': 'Chicken Mushroom Pizza',
          'price': '299.00',
          'quantity': 2,
        },
        {
          'imageUrl': TImageString.pizzaProduct3,
          'name': 'Margherita Pizza',
          'price': '249.00',
          'quantity': 1,
        },
      ],
    },
  ];

  static const List<String> promoBanners = [
    TImageString.promoBanner3,
    TImageString.promoBanner1,
    TImageString.promoBanner2,
  ];
}
