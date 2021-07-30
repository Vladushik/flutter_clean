import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/util/input_converter.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:flutter_clean/features/author/domain/usecases/get_similar.dart';
import 'package:flutter_clean/features/author/presentation/bloc/bloc.dart';
import 'package:bloc/bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class SimilarBloc extends Bloc<SimilarEvent, SimilarState> {
  final GetSimilar getSimilar;

  final InputConverter inputConverter;

  SimilarBloc({
    required GetSimilar concrete,
    required this.inputConverter,
  })   : assert(concrete != null),
        assert(inputConverter != null),
        getSimilar = concrete,
        super(Empty());

  @override
  SimilarState get initialState => Empty();

  @override
  Stream<SimilarState> mapEventToState(SimilarEvent event) async* {
    if (event is GetSimilarData) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.nameString);

      yield* inputEither.fold(
        (failure) async* {
          yield Error(message: INVALID_INPUT_FAILURE_MESSAGE);
        },
        (String) async* {
          yield Loading();

          final failureOrSimilar = await getSimilar(Params(name: String));
          yield* _eitherLoadedOrErrorState(failureOrSimilar);

          yield failureOrSimilar.fold(
            (failure) => Error(message: _mapFailureToMessage(failure)),
            (datum) => Loaded(datum: datum),
          );
        },
      );
    }
  }

  Stream<SimilarState> _eitherLoadedOrErrorState(
    Either<Failure, Datum> either,
  ) async* {
    yield either.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (datum) => Loaded(datum: datum),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
