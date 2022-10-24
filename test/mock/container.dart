import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:picbook/common/logger_provider.dart';
import 'package:picbook/infrastructure/analytics_service.dart';
import 'package:picbook/infrastructure/auth_repository.dart';
import 'package:picbook/infrastructure/books_repository.dart';
import 'package:picbook/infrastructure/bookshelf_repository.dart';
import 'package:picbook/infrastructure/rakuten_book_repository.dart';
import 'package:picbook/infrastructure/user_repository.dart';
import 'package:picbook/infrastructure/bookshelf_history_repository.dart';

import 'container.mocks.dart';

@GenerateMocks([
  Logger,
  AnalyticsService,
  UserRepository,
  AuthRepository,
  BookshelfRepository,
  BooksRepository,
  RakutenBookRepository,
  BookshelfHistoryRepository
])
final mockLogger = MockLogger();
final mockAnalyticsService = MockAnalyticsService();
final mockUserRepository = MockUserRepository();
final mockAuthRepository = MockAuthRepository();
final mockBookshelfRepository = MockBookshelfRepository();
final mockBooksRepository = MockBooksRepository();
final mockRakutenBookRepository = MockRakutenBookRepository();
final mockBookshelfHistoryRepository = MockBookshelfHistoryRepository();

ProviderContainer overrideUserRepository() {
  return ProviderContainer(overrides: [
    loggerProvider.overrideWithProvider(
      Provider(((ref) => mockLogger)),
    ),
    analyticsServiceProvider
        .overrideWithProvider(Provider((ref) => mockAnalyticsService)),
    userRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockUserRepository),
    ),
    authRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockAuthRepository),
    ),
    bookshelfRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockBookshelfRepository),
    ),
    booksRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockBooksRepository),
    ),
    rakutenBookRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockRakutenBookRepository),
    ),
    bookshelfHistoryRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockBookshelfHistoryRepository),
    ),
  ]);
}
