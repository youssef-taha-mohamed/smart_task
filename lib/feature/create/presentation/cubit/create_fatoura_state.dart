part of 'create_fatoura_cubit.dart';

sealed class CreateFatouraState {}

final class CreateFatouraInitial extends CreateFatouraState {}

final class CreateFatouraItemsUpdated extends CreateFatouraState {
  final List<FatouraItem> items;

  CreateFatouraItemsUpdated(this.items);
}

final class CreateFatouraLoading extends CreateFatouraState {}

final class CreateFatouraSuccess extends CreateFatouraState {}

final class CreateFatouraError extends CreateFatouraState {
  final String message;

  CreateFatouraError(this.message);
}