// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sales_progress_report/shared/theme_type_def.dart';

class MeasureSizeHook extends HookWidget {
  final Widget child;
  final SizeFunction onChange;

  const MeasureSizeHook({
    Key? key,
    required this.child,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contextKey = useMemoized(() => GlobalKey());
    final oldSize = useRef<Size?>(null);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final contextBox = contextKey.currentContext?.findRenderObject() as RenderBox?;
        if (contextBox != null) {
          final newSize = contextBox.size;
          if (oldSize.value == null || oldSize.value != newSize) {
            oldSize.value = newSize;
            onChange(newSize);
          }
        }
      });
      return null;
    }, []);

    return Container(
      key: contextKey,
      child: child,
    );
  }
}
