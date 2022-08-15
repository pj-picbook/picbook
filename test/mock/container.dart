import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/rakuten_book_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';

import 'container.mocks.dart';

@GenerateMocks([
  Logger,
  UserRepository,
  AuthRepository,
  BookshelfRepository,
  RakutenBookRepository
])
final mockLogger = MockLogger();
final mockUserRepository = MockUserRepository();
final mockAuthRepository = MockAuthRepository();
final mockBookshelfRepository = MockBookshelfRepository();
final mockRakutenBookRepository = MockRakutenBookRepository();

ProviderContainer overrideUserRepository() {
  return ProviderContainer(overrides: [
    loggerProvider.overrideWithProvider(
      Provider(((ref) => mockLogger)),
    ),
    userRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockUserRepository),
    ),
    authRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockAuthRepository),
    ),
    bookshelfRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockBookshelfRepository),
    ),
    rakutenBookRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockRakutenBookRepository),
    ),
  ]);
}
