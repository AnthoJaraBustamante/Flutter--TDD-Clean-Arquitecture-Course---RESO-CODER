import 'package:clean_arq_tdd_course/core/error/failures.dart';
import 'package:clean_arq_tdd_course/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';



abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
