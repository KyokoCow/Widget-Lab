import 'package:flutter/material.dart';

Widget? buildIcon(String? name) {
  switch (name) {
    case 'search':
      return const Icon(Icons.search);
    case 'home':
      return const Icon(Icons.home);
    case 'person':
      return const Icon(Icons.person);
    case 'favorite':
      return const Icon(Icons.favorite);
    case 'email':
      return const Icon(Icons.email);
    case 'phone':
      return const Icon(Icons.phone);
    case 'settings':
      return const Icon(Icons.settings);
    case 'menu':
      return const Icon(Icons.menu);
    case 'clear':
      return const Icon(Icons.clear);
    case 'none':
    default:
      return null;
  }
}