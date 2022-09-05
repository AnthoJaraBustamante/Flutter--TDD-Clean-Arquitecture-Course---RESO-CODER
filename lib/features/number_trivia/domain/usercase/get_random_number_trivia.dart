import 'package:clean_arq_tdd_course/core/error/failures.dart';
import 'package:clean_arq_tdd_course/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
