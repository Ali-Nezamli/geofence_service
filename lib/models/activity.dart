import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';

export 'package:activity_recognition_flutter/activity_recognition_flutter.dart' show ActivityType;

/// Defines the confidence of activity.
enum ActivityConfidence {
  /// High accuracy: 80~100
  HIGH,

  /// Medium accuracy: 50~80
  MEDIUM,

  /// Low accuracy: 0~50
  LOW
}

/// A model representing the user's activity.
class Activity {
  /// The type of activity recognized.
  final ActivityType type;

  /// The confidence of activity recognized.
  final ActivityConfidence confidence;

  /// Constructs an instance of [Activity].
  const Activity(this.type, this.confidence);

  /// Constructs an instance of [Activity] from an [ActivityEvent].
  factory Activity.fromEvent(ActivityEvent event) {
    final ActivityConfidence confidence;
    if (event.confidence >= 80) {
      confidence = ActivityConfidence.HIGH;
    } else if (event.confidence >= 50) {
      confidence = ActivityConfidence.MEDIUM;
    } else {
      confidence = ActivityConfidence.LOW;
    }
    return Activity(event.type, confidence);
  }

  /// Returns the data fields of [Activity] in JSON format.
  Map<String, dynamic> toJson() => {'type': type, 'confidence': confidence};

  /// Gets an activity of type UNKNOWN.
  static Activity get unknown => const Activity(ActivityType.UNKNOWN, ActivityConfidence.LOW);

  @override
  bool operator ==(Object other) =>
      other is Activity && runtimeType == other.runtimeType && type == other.type && confidence == other.confidence;

  @override
  int get hashCode => type.hashCode ^ confidence.hashCode;
}
