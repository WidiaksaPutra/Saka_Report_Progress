import 'dart:io';

class ListRemoveRiverpod{
  List removeList({required int index, required List data}) {
    return data.removeAt(index);
  }
}

class ListFileRemoveRiverpod{
  List<File?> removeList({required int index, required List data}) {
    final newData = List<File?>.from(data);
    newData.removeAt(index);
    return newData;
  }
}

class ListStringRemoveRiverpod{
  List<String> removeList({required int index, required List data}) {
    final newData = List<String>.from(data);
    newData.removeAt(index);
    return newData;
  }
}
