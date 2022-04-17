library profile_screen;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants/ui_constants/ui_constants.dart';
import 'package:project/presentation/widgets/text_field_customization/text_field_customization.dart';
import 'package:project/providers/users_provider.dart';
import 'package:provider/provider.dart';


part 'profile_page.dart';

part 'bloc/profile_bloc.dart';
part 'bloc/profile_event.dart';
part 'bloc/profile_state.dart';