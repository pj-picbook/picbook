import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final analyticsProvider = Provider(((ref) => AnalyticsProvider()));

class AnalyticsProvider {
  final analytics = FirebaseAnalytics.instance;
  get observer => FirebaseAnalyticsObserver(analytics: analytics);
}
