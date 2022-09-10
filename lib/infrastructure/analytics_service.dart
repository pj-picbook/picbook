import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:picbook/infrastructure/provider/analytics_provider.dart';

final analyticsServiceProvider = Provider(
  (ref) => AnalyticsService(
    analyticsProvider: ref.read(analyticsProvider),
  ),
);

enum AnalyticsEvent { button }

extension AnalyticsEventExt on AnalyticsEvent {
  String get name {
    switch (this) {
      case AnalyticsEvent.button:
        return 'button';
    }
  }
}

class AnalyticsService {
  final AnalyticsProvider _provider;
  AnalyticsService({required AnalyticsProvider analyticsProvider})
      : _provider = analyticsProvider;

  /// ボタンタップイベント送信
  Future<void> sendButtonEvent({required String buttonName}) async {
    _sendEvent(
        event: AnalyticsEvent.button, parameterMap: {'buttonName': buttonName});
  }

  /// イベントを送信する
  /// [event] AnalyticsEvent
  /// [parameterMap] パラメータMap
  Future<void> _sendEvent(
      {required AnalyticsEvent event,
      Map<String, dynamic>? parameterMap}) async {
    _provider.analytics.logEvent(name: event.name, parameters: parameterMap);
  }
}
