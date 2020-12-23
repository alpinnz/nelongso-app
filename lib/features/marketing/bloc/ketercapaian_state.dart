part of 'ketercapaian_bloc.dart';

abstract class KetercapaianState extends Equatable {
  const KetercapaianState();

  @override
  List<Object> get props => [];
}

class KetercapaianInitial extends KetercapaianState {
  const KetercapaianInitial();
  @override
  List<Object> get props => [];
}

class KetercapaianLoading extends KetercapaianState {
  const KetercapaianLoading();
  @override
  List<Object> get props => null;
}

class KetercapaianError extends KetercapaianState {
  final String message;
  const KetercapaianError(this.message);
  @override
  List<Object> get props => [message];
}

class KetercapaianOmzetLoaded extends KetercapaianState {
  final List<KetercapaianOmzetModel> data;
  const KetercapaianOmzetLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class KetercapaianRegionalLoaded extends KetercapaianState {
  final List<KetercapaianRegionalModel> data;
  const KetercapaianRegionalLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class KetercapaianAllregionalLoaded extends KetercapaianState {
  final List<KetercapaianAllregionalModel> data;
  const KetercapaianAllregionalLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class KetercapaianKunjunganLoaded extends KetercapaianState {
  final List<KetercapaianKunjunganModel> data;
  const KetercapaianKunjunganLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class KetercapaianOutletLoaded extends KetercapaianState {
  final List<KetercapaianOutletModel> data;
  const KetercapaianOutletLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class KetercapaianBasketLoaded extends KetercapaianState {
  final List<KetercapaianBasketModel> data;
  const KetercapaianBasketLoaded(this.data);
  @override
  List<Object> get props => [data];
}

class KetercapaianSelisihLoaded extends KetercapaianState {
  final List<KetercapaianSelisihModel> data;
  const KetercapaianSelisihLoaded(this.data);
  @override
  List<Object> get props => [data];
}
