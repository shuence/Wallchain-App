import 'package:equatable/equatable.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavInitial extends BottomNavState {
  final int selectedIndex;

  const BottomNavInitial(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
