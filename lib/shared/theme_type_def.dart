// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

typedef voidFunction = void Function()?;
typedef voidFunctionNotNull = void Function();
typedef ContextFunction = void Function(BuildContext context);
typedef BoolFunction = void Function(bool)?;
typedef SizeFunction = void Function(Size size);
typedef StreamPosition = Stream<Position?>?;
typedef onSelected = void Function(String)?;
typedef onChangedString = dynamic Function(String);
typedef validator = String? Function(String?)?;
typedef onChangedBool = void Function(bool?)?;
typedef valueListenable = ValueListenable<List<String>>;
typedef voidFunctionContextTextEditingFocusNode = Widget Function(BuildContext, TextEditingController, FocusNode, void Function());
