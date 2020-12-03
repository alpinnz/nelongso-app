part of 'noncash_bloc.dart';

abstract class NoncashState extends Equatable {
  const NoncashState();

  @override
  List<Object> get props => [];
}

class NoncashInitial extends NoncashState {
  const NoncashInitial();
  @override
  List<Object> get props => [];
}

class NoncashLoading extends NoncashState {
  const NoncashLoading();
  @override
  List<Object> get props => null;
}

class NoncashGorestoLoaded extends NoncashState {
  final List<NoncashGorestoModel> noncashGoresto;
  const NoncashGorestoLoaded(this.noncashGoresto);
  @override
  List<Object> get props => [noncashGoresto];
}

class NoncashGrabrestoLoaded extends NoncashState {
  final List<NoncashGrabrestoModel> noncashGrabresto;
  const NoncashGrabrestoLoaded(this.noncashGrabresto);
  @override
  List<Object> get props => [noncashGrabresto];
}

class NoncashGojekandgrabLoaded extends NoncashState {
  final List<NoncashGojekandgrabModel> noncashGojekandgrabModel;
  const NoncashGojekandgrabLoaded(this.noncashGojekandgrabModel);
  @override
  List<Object> get props => [noncashGojekandgrabModel];
}

class NoncashSaldograbrestoLoaded extends NoncashState {
  final List<NoncashSaldograbrestoModel> noncashSaldograbresto;
  const NoncashSaldograbrestoLoaded(this.noncashSaldograbresto);
  @override
  List<Object> get props => [noncashSaldograbresto];
}

class NoncashSaldogorestoLoaded extends NoncashState {
  final List<NoncashSaldogorestoModel> noncashSaldogoresto;
  const NoncashSaldogorestoLoaded(this.noncashSaldogoresto);
  @override
  List<Object> get props => [noncashSaldogoresto];
}

class NoncashError extends NoncashState {
  final String message;
  const NoncashError(this.message);
  @override
  List<Object> get props => [message];
}
