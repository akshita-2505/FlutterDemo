import 'package:flutter/cupertino.dart';

class Item {
  Item({@required this.id, @required this.body});

  final int id;
  final String body;

  Item copyWith({int id, String body}) {
    return Item(
      id: id ?? this.id,
      body: body ?? this.body,
    );
  }
}

class AppState {
  final List<Item> items;

  AppState({@required this.items});

  AppState.initialState() : items = List.unmodifiable(<Item>[]);

}