import 'package:dartz/dartz.dart';
import 'package:flutter_clean/features/author/domain/entities/similar_entity.dart';
import 'package:flutter_clean/features/author/domain/repositories/similar_repository.dart';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

// class MockAuthorsRepository extends Mock implements SimilarRepository {
//
// void main() {
//   GetAuthors? usecase;
//   MockAuthorsRepository? mockArtistRepository;
//   setUp(() {
//     mockArtistRepository = MockAuthorsRepository();
//     usecase = GetArtist(mockArtistRepository!);
//   });
//
//   // TODO: 3
//
//   final tAuthor = Author(name: 'name', type: Type.AUTHOR)
//
//   test(
//     'should get artist from the repository',
//       () async {
//       when(mockArtistRepository!.getAuthors(any))
//           .thenAnswer((_) async =>Right(tAuthor));
//
//       final result  = await usecase!.execute(number:20);
//       expect(result, Right(tAuthor));
//       verify(mockArtistRepository!.getArtist(42));
//       verifyNoMoreInteractions(mockArtistRepository);
//       },
//
//
//   );
// }
