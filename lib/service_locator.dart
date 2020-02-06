import 'package:basic_scrolllist/scoped_models/event_list_model.dart';
import 'package:basic_scrolllist/services/api_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Register services
  locator.registerLazySingleton<ApiService>(() => ApiService());

  // Register models
  locator.registerFactory<EventListModel>(() => EventListModel());
}