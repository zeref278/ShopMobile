library authentication_screen;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants/ui_constants/ui_constants.dart';
import 'package:project/models/user.dart';
import 'package:project/presentation/drawer_customization/menu_screen.dart';
import 'package:project/providers/users_provider.dart';
import 'package:provider/provider.dart';



part 'screens/login_page.dart';
part 'screens/signup_page.dart';

part 'bloc/authentication_bloc.dart';
part 'bloc/authentication_event.dart';
part 'bloc/authentication_state.dart';