import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:picbook/domain/entity/book.dart';

part 'stamp_state.freezed.dart';

@freezed
class StampState with _$StampState {
  const StampState._();

  factory StampState({
    required DateTime? focusedDay,
    required DateTime? selectedDay,
    required Map<DateTime, List<Book>>? events,
    required List<Book>? books,
  }) = _StampState;
}
