import '../models/product.dart';

/// Static product catalog. In a real app this would come from an API.
const List<Product> catalog = <Product>[
  Product(
    id: 'apple-airpods',
    brand: 'Apple',
    title: 'AirPods Pro',
    price: 100,
    description: 'Wireless earbuds with active noise cancellation',
  ),
  Product(
    id: 'samsung-buds',
    brand: 'Samsung',
    title: 'Galaxy Buds',
    price: 100,
    description: 'Compact earbuds with a 30 hour battery case',
  ),
  Product(
    id: 'sony-headphones',
    brand: 'Sony',
    title: 'WH-1000XM5',
    price: 200,
    description: 'Over-ear headphones with best in class ANC',
  ),
  Product(
    id: 'tesla-powerwall',
    brand: 'Tesla',
    title: 'Powerwall',
    price: 1000,
    description: 'Home battery that stores solar energy for the night',
  ),
  Product(
    id: 'apple-watch',
    brand: 'Apple',
    title: 'Apple Watch SE',
    price: 200,
    description: 'Fitness and health tracking on your wrist',
  ),
  Product(
    id: 'apple-pencil',
    brand: 'Apple',
    title: 'Apple Pencil',
    price: 100,
    description: 'Pixel perfect stylus for drawing and notes',
  ),
  Product(
    id: 'tesla-charger',
    brand: 'Tesla',
    title: 'Wall Connector',
    price: 200,
    description: 'Fast home charging for any Tesla model',
  ),
  Product(
    id: 'sony-tv',
    brand: 'Sony',
    title: 'Bravia XR 55"',
    price: 1000,
    description: '4K OLED TV with cognitive picture processing',
  ),
  Product(
    id: 'tesla-wheels',
    brand: 'Tesla',
    title: 'Aero Wheel Covers',
    price: 200,
    description: 'A set of four covers that add range to Model 3',
  ),
  Product(
    id: 'samsung-charger',
    brand: 'Samsung',
    title: '45W Charger',
    price: 100,
    description: 'Super fast charging adapter with USB-C cable',
  ),
  Product(
    id: 'samsung-tab',
    brand: 'Samsung',
    title: 'Galaxy Tab A9',
    price: 200,
    description: 'Lightweight tablet for reading and video calls',
  ),
  Product(
    id: 'sony-camera',
    brand: 'Sony',
    title: 'Alpha A7 IV',
    price: 1000,
    description: 'Full frame mirrorless camera for photo and video',
  ),
];
