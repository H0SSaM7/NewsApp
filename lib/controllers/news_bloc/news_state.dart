part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class BusinessNewsSuccessState extends NewsState {
  final List<NewsModel> businessList;
  const BusinessNewsSuccessState(this.businessList);
  @override
  List<Object> get props => [businessList];
}

class BusinessNewsErrorState extends NewsState {
  final String error;

  const BusinessNewsErrorState(this.error);
  @override
  List<Object> get props => [error];
}

class SportNewsSuccessState extends NewsState {
  final List<NewsModel> sportList;
  const SportNewsSuccessState(this.sportList);
  @override
  List<Object> get props => [sportList];
}

class SportNewsErrorState extends NewsState {
  const SportNewsErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}

class ScienceNewsSuccessState extends NewsState {
  final List<NewsModel> scienceList;
  const ScienceNewsSuccessState(this.scienceList);
  @override
  List<Object> get props => [scienceList];
}

class ScienceNewsErrorState extends NewsState {
  final String error;
  const ScienceNewsErrorState(this.error);
  @override
  List<Object> get props => [error];
}
