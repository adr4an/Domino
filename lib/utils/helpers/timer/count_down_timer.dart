import 'dart:async';
import 'package:domino/utils/local_storage/storage_utility.dart';
import 'package:get/get.dart';

class TCountdownTimer {
  TCountdownTimer({required this.storageKey});

  final String storageKey;
  final _storage = TLocalStorage();

  final RxInt secondsLeft = 0.obs;
  final RxBool isRunning = false.obs;

  Timer? _timer;

  void resumeIfActive() {
    final endTime = _storage.readData<int>(storageKey);

    if (endTime != null) {
      final remaining =
          ((endTime - DateTime.now().millisecondsSinceEpoch) / 1000).ceil();

      if (remaining > 0) {
        _run(remaining);
        return;
      } else {
        _storage.removeData(storageKey);
      }
    }

    secondsLeft.value = 0;
    isRunning.value = false;
  }

  /// Starts (or restarts) the countdown for [durationSeconds], persisting
  /// the end time so it survives navigation/app restarts.
  void start(int durationSeconds) {
    final endTime = DateTime.now().add(Duration(seconds: durationSeconds));
    _storage.saveData(storageKey, endTime.millisecondsSinceEpoch);
    _run(durationSeconds);
  }

  void _run(int fromSeconds) {
    secondsLeft.value = fromSeconds;
    isRunning.value = true;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value <= 1) {
        timer.cancel();
        secondsLeft.value = 0;
        isRunning.value = false;
        _storage.removeData(storageKey);
      } else {
        secondsLeft.value--;
      }
    });
  }

  void cancel() {
    _timer?.cancel();
    secondsLeft.value = 0;
    isRunning.value = false;
    _storage.removeData(storageKey);
  }

  void dispose() {
    _timer?.cancel();
  }
}
