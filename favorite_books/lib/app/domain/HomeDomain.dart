import 'package:favorite_books/app/entity/Book.dart';
import 'package:hive/hive.dart';

void onFavoritePress(int index, Box<String> favoriteBooksBox) {
  if (favoriteBooksBox.containsKey(index)) {
    favoriteBooksBox.delete(index);
    return;
  }
  favoriteBooksBox.put(index, books[index]);
}