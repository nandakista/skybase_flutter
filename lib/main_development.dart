import './main.dart' as main_app;
import 'core/app/app_env.dart';

void main() async {
  AppEnv.set(Env.DEVELOPMENT);
  main_app.main();
}