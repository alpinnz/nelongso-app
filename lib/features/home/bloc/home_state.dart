part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeAdmin extends HomeState {
  final AccountModel data;
  const HomeAdmin(this.data);
  @override
  List<Object> get props => [data];
}

class HomeOwner extends HomeState {
  final AccountModel data;
  const HomeOwner(this.data);
  @override
  List<Object> get props => [data];
}

class HomeCOBisdev extends HomeState {
  final AccountModel data;
  const HomeCOBisdev(this.data);
  @override
  List<Object> get props => [data];
}

class HomeCOFinance extends HomeState {
  final AccountModel data;
  const HomeCOFinance(this.data);
  @override
  List<Object> get props => [data];
}

class HomeCOOperasional extends HomeState {
  final AccountModel data;
  const HomeCOOperasional(this.data);
  @override
  List<Object> get props => [data];
}

class HomeCOProduksi extends HomeState {
  final AccountModel data;
  const HomeCOProduksi(this.data);
  @override
  List<Object> get props => [data];
}

class HomeCOMarketing extends HomeState {
  final AccountModel data;
  const HomeCOMarketing(this.data);
  @override
  List<Object> get props => [data];
}

class HomeCOHrd extends HomeState {
  final AccountModel data;
  const HomeCOHrd(this.data);
  @override
  List<Object> get props => [data];
}

class HomeUser extends HomeState {
  final AccountModel data;
  const HomeUser(this.data);
  @override
  List<Object> get props => [data];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
  @override
  List<Object> get props => [message];
}
