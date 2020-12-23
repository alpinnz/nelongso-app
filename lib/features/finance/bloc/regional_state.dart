part of 'regional_bloc.dart';

abstract class RegionalState extends Equatable {
  const RegionalState();

  @override
  List<Object> get props => [];
}

class RegionalInitial extends RegionalState {}

class RegionalLoading extends RegionalState {
  const RegionalLoading();
  @override
  List<Object> get props => null;
}

class RegionalError extends RegionalState {
  final String message;
  const RegionalError(this.message);
  @override
  List<Object> get props => [message];
}

class RegionalOutletLoaded extends RegionalState {
  final List<RegionalOutletModel> regionalOutlet;
  const RegionalOutletLoaded(this.regionalOutlet);
  @override
  List<Object> get props => [regionalOutlet];
}

class RegionalOperasionalLoaded extends RegionalState {
  final List<RegionalOperasionalModel> regionalOperasional;
  const RegionalOperasionalLoaded(this.regionalOperasional);
  @override
  List<Object> get props => [regionalOperasional];
}

class RegionalHppLoaded extends RegionalState {
  final List<RegionalHppModel> regionalHpp;
  const RegionalHppLoaded(this.regionalHpp);
  @override
  List<Object> get props => [regionalHpp];
}

class RegionalKunjunganLoaded extends RegionalState {
  final List<RegionalKunjunganModel> regionalKunjungan;
  const RegionalKunjunganLoaded(this.regionalKunjungan);
  @override
  List<Object> get props => [regionalKunjungan];
}

class RegionalPersentasekunjunganLoaded extends RegionalState {
  final List<RegionalPersentaseKunjunganModel> regionalPersentaseKunjungan;
  const RegionalPersentasekunjunganLoaded(this.regionalPersentaseKunjungan);
  @override
  List<Object> get props => [regionalPersentaseKunjungan];
}

class RegionalOmzetpershiftLoaded extends RegionalState {
  final List<RegionalOmzetpershiftModel> regionalOmzetpershift;
  const RegionalOmzetpershiftLoaded(this.regionalOmzetpershift);
  @override
  List<Object> get props => [regionalOmzetpershift];
}

class RegionalOmzetofflineandonlineLoaded extends RegionalState {
  final List<RegionalOmzetofflineandonlineModel> regionalOmzetofflineandonline;
  const RegionalOmzetofflineandonlineLoaded(this.regionalOmzetofflineandonline);
  @override
  List<Object> get props => [regionalOmzetofflineandonline];
}

class RegionalMenuLoaded extends RegionalState {
  final List<RegionalMenuModel> regionalMenu;
  const RegionalMenuLoaded(this.regionalMenu);
  @override
  List<Object> get props => [regionalMenu];
}
