import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:novelty_app/features/chat/domain/entities/thread.dart';
import 'package:novelty_app/features/chat/domain/repositories/thread_repository.dart';

class ThreadModel extends ChangeNotifier {
  List<Thread> _threads;
  UnmodifiableListView<Thread> get threads => UnmodifiableListView(_threads);

  bool isLoading = true;

  ThreadRepository repository;

  ThreadModel({
    required this.repository,
    List<Thread>? threads,
  }) : _threads = threads ?? [];

  Future<void> fetchThreads() async {
    isLoading = true;
    var data = await repository.fetchThreads();
    data!.fold((l) => (null), (r) => (_threads = r!));
    isLoading = false;
    notifyListeners();
  }
}
