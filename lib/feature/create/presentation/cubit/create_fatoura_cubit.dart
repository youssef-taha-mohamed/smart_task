import 'package:flutter_bloc/flutter_bloc.dart';
part 'create_fatoura_state.dart';

class CreateFatouraCubit extends Cubit<CreateFatouraState> {
  CreateFatouraCubit() : super(CreateFatouraInitial());

  List<FatouraItem> items = [];

  void addItem() {
    final newItem = FatouraItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'طلمبة ملفقات MOHD',
      price: 450000,
      quantity: 150,
    );

    items.add(newItem);
    emit(CreateFatouraItemsUpdated(List.from(items)));
  }

  void removeItem(String id) {
    items.removeWhere((item) => item.id == id);
    emit(CreateFatouraItemsUpdated(List.from(items)));
  }

  void updateItemQuantity(String id, int quantity) {
    final index = items.indexWhere((item) => item.id == id);
    if (index != -1) {
      items[index] = items[index].copyWith(quantity: quantity);
      emit(CreateFatouraItemsUpdated(List.from(items)));
    }
  }

  void clearItems() {
    items.clear();
    emit(CreateFatouraItemsUpdated(List.from(items)));
  }
}

class FatouraItem {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final bool isExpanded;

  FatouraItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.isExpanded = false,
  });

  double get total => price * quantity;

  FatouraItem copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    bool? isExpanded,
  }) {
    return FatouraItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}