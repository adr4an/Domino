import 'package:domino/utils/constants/image/image_strings.dart';

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
}
