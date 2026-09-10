# Vivaclons Store

A small Flutter shop demo: sign in, browse the product catalog, collect items
in a basket and check out.

Built with **Flutter 3.35 / Dart 3.9** (null safety, Material 3) and
[`provider`](https://pub.dev/packages/provider) for state management.

## Screens

| Screen | File | What it does |
| --- | --- | --- |
| Login | `lib/screens/login_screen.dart` | Validated sign-in form (user name ≥ 3, password ≥ 4 characters) |
| Catalog | `lib/screens/home_screen.dart` | 12 products with prices, add / +1 / −1 straight from the list |
| Basket | `lib/screens/cart_screen.dart` | Quantities per product, line totals, running total, clear |
| Order | `lib/screens/checkout_screen.dart` | Confirmation after buying; the basket is emptied |

## Project layout

```
lib/
├── data/catalog.dart        static product list
├── models/                  Product, CartLine
├── screens/                 login, catalog, basket, order
├── state/cart_model.dart    ChangeNotifier holding the basket
├── utils/format.dart        price formatting (1 000 ₸)
├── widgets/                 CartButton, ProductAvatar
└── main.dart                app entry point, theme and routes
```

The basket is keyed by `Product.id`, so two products of the same brand — or
with the same price — never get mixed up.

## Running

```bash
flutter pub get
flutter run              # -d chrome / -d android
```

## Checks

```bash
flutter analyze
flutter test
```
