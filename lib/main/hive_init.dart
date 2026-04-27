import 'package:hive_flutter/hive_flutter.dart';
import 'package:sales_progress_report/model/hive/dropdown/dropdown_list_project_progress_report/dropdown_list_project_progress_report.dart';
import 'package:sales_progress_report/model/hive/dropdown/dropdown_list_type_progress_report/dropdown_list_type_progress_report.dart';
import 'package:flutter/material.dart';

class HiveService with WidgetsBindingObserver {
  static final HiveService instance = HiveService._internal();
  factory HiveService() => instance;
  HiveService._internal();

  static bool _initialized = false;
  static final Map<String, Box> _openedBoxes = {};
  static final Set<String> _knownBoxNames = {};

  Future<void> initializeWithLifecycle() async {
    if (_initialized) return;
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addObserver(this);

    await hiveInit();
    debugPrint('🔗 Hive lifecycle attached');
  }

  Future<void> hiveInit() async {
    if (_initialized) return;
    _initialized = true;

    try {
      await Hive.initFlutter();
      _registerAdapters();
      await _openEssentialBoxes();
      debugPrint('✅ Hive initialized successfully');
    } catch (e, s) {
      debugPrint('❌ Hive init failed: $e\n$s');
    }
  }

  void _registerAdapters() {
    Hive.registerAdapter(DropdownListTypeProgressReportHiveAdapter());
    Hive.registerAdapter(DropdownListProjectProgressReportHiveAdapter());
  }

  Future<void> _openEssentialBoxes() async {
    final essential = <Future>[
      _openBoxSafe<String>('access_token'),
      _openBoxSafe<String>('username'),
      _openBoxSafe<String>('password'),
      _openBoxSafe<bool>('mode_online'),
      _openBoxSafe<String>('device_id'),
    ];
    await Future.wait(essential);
  }

  /// 🔹 Membuka box dengan aman + tracking
  Future<Box<T>> getBox<T>(String name) async {
    if (_openedBoxes.containsKey(name)) {
      return _openedBoxes[name] as Box<T>;
    }

    try {
      Box<T> box;
      if (Hive.isBoxOpen(name)) {
        box = Hive.box<T>(name);
      } else {
        box = await Hive.openBox<T>(name);
      }
      _openedBoxes[name] = box;
      _knownBoxNames.add(name);
      return box;
    } catch (e) {
      debugPrint('⚠️ Failed to open [$name], trying recovery: $e');

      try {
        await Hive.deleteBoxFromDisk(name);
        final box = await Hive.openBox<T>(name);
        _openedBoxes[name] = box;
        _knownBoxNames.add(name);
        debugPrint('🧹 Box [$name] recovered');
        return box;
      } catch (e2) {
        debugPrint('❌ Failed even after recovery [$name]: $e2');
        rethrow;
      }
    }
  }

  Future<Box<T>> _openBoxSafe<T>(String name) async {
    if (Hive.isBoxOpen(name)) {
      _knownBoxNames.add(name);
      return Hive.box<T>(name);
    }

    try {
      final box = await Hive.openBox<T>(name);
      _openedBoxes[name] = box;
      _knownBoxNames.add(name);
      return box;
    } catch (e) {
      await Hive.deleteBoxFromDisk(name);
      final box = await Hive.openBox<T>(name);
      _openedBoxes[name] = box;
      _knownBoxNames.add(name);
      return box;
    }
  }

  Box<T>? getCachedBox<T>(String name) {
    if (_openedBoxes.containsKey(name)) {
      return _openedBoxes[name] as Box<T>;
    }
    if (Hive.isBoxOpen(name)) {
      final box = Hive.box<T>(name);
      _openedBoxes[name] = box;
      return box;
    }
    return null;
  }

  Future<void> clearAll() async {
    for (final box in _openedBoxes.values) {
      await box.clear();
    }
    debugPrint('🧽 All boxes cleared safely');
  }

  Future<void> closeAll() async {
    for (final box in _openedBoxes.values) {
      await box.close();
    }
    _openedBoxes.clear();
    debugPrint('📦 All boxes closed');
  }

  Future<void> openAllLegacyBoxes() async {
    final names = [
      'dropdown_list_project_progress_report',
      'dropdown_list_type_progress_report',
    ];

    await Future.wait(names.map(_openBoxSafe<dynamic>));
    debugPrint('📦 All legacy boxes opened safely');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint('🔄 App resumed - re-opening known boxes');
        await _reopenKnownBoxes();
        break;

      case AppLifecycleState.paused:
        debugPrint('⏸️ App paused');
        break;

      case AppLifecycleState.detached:
        debugPrint('🧩 App detached - closing all Hive boxes');
        await closeAll();
        break;

      case AppLifecycleState.inactive:
        break;

      case AppLifecycleState.hidden:
        break;
    }
  }

  Future<void> _reopenKnownBoxes() async {
    for (final name in _knownBoxNames) {
      if (!Hive.isBoxOpen(name)) {
        try {
          final box = await Hive.openBox(name);
          _openedBoxes[name] = box;
          debugPrint('📦 Box [$name] reopened');
        } catch (e) {
          debugPrint('⚠️ Failed to reopen [$name]: $e');
        }
      }
    }
  }

  void detachLifecycle() {
    WidgetsBinding.instance.removeObserver(this);
    debugPrint('🔌 Hive lifecycle detached');
  }
}