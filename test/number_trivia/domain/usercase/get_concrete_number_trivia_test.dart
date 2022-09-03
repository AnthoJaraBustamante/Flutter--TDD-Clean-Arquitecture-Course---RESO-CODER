import 'package:clean_arq_tdd_course/core/error/failures.dart';
import 'package:clean_arq_tdd_course/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arq_tdd_course/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_arq_tdd_course/number_trivia/domain/usercase/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });
  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test', number: 1);
  test(
    'shoud get trivia for the number from the repository',
    () async {
      //arrange
      when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(any()))
          .thenAnswer((_) async => const Right(tNumberTrivia));
      //act 
      final Either<Failure, NumberTrivia> result = await usecase.execute(number: tNumber);
      //assert
      expect(result, const Right(tNumberTrivia));
      verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
