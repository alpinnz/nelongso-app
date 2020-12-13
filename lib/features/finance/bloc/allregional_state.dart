part of 'allregional_bloc.dart';

abstract class AllregionalState extends Equatable {
  const AllregionalState();

  @override
  List<Object> get props => [];
}

class AllregionalInitial extends AllregionalState {}

class AllregionalLoading extends AllregionalState {
  const AllregionalLoading();
  @override
  List<Object> get props => null;
}

class AllregionalError extends AllregionalState {
  final String message;
  const AllregionalError(this.message);
  @override
  List<Object> get props => [message];
}

class AllregionalDataLoaded extends AllregionalState {
  final List<AllregionalDataModel> allregionalDataModel;
  const AllregionalDataLoaded(this.allregionalDataModel);
  @override
  List<Object> get props => [allregionalDataModel];
}

class AllregionalShareLoaded extends AllregionalState {
  final List<AllregionalShareModel> allregionalShareModel;
  const AllregionalShareLoaded(this.allregionalShareModel);
  @override
  List<Object> get props => [allregionalShareModel];
}

class AllregionalWeakLoaded extends AllregionalState {
  final List<AllregionalWeakModel> allregionalWeakModel;
  const AllregionalWeakLoaded(this.allregionalWeakModel);
  @override
  List<Object> get props => [allregionalWeakModel];
}

class AllregionalBiayaLoaded extends AllregionalState {
  final List<AllregionalBiayaModel> allregionalBiayaModel;
  const AllregionalBiayaLoaded(this.allregionalBiayaModel);
  @override
  List<Object> get props => [allregionalBiayaModel];
}

class AllregionalFinalLoaded extends AllregionalState {
  final List<AllregionalFinalModel> allregionalFinalModel;
  const AllregionalFinalLoaded(this.allregionalFinalModel);
  @override
  List<Object> get props => [allregionalFinalModel];
}

class AllregionalPphLoaded extends AllregionalState {
  final List<AllregionalPphModel> allregionalPphModel;
  const AllregionalPphLoaded(this.allregionalPphModel);
  @override
  List<Object> get props => [allregionalPphModel];
}
