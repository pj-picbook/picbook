import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/user_repository.dart';

import 'user_repository_mock.dart';

// UserRepository
ProviderContainer overrideUserRepository() {
  return ProviderContainer(overrides: [
    userRepository.overrideWithProvider(
      Provider((ref) => UserRepositoryMock()),
    )
  ]);
}
