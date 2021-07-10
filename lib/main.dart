import 'package:atsign_ecare/app.dart';
import 'package:atsign_ecare/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService notificationService = NotificationService();
  notificationService.init();
  // notificationService.initializePlatformSpecifics();
  runApp(ProviderScope(child: MyApp()));
}
