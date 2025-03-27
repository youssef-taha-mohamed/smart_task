part of 'layout_cubit.dart';

sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}

class ChangeBottomNavState extends LayoutState {}

class RefreshCrowdsScreenState extends LayoutState {}

class RefreshState extends LayoutState {}
