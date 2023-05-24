import 'package:todo_with_bloc/runner.dart';
import 'package:todo_with_bloc/src/core/config/app_config.dart';
import 'package:todo_with_bloc/src/core/config/environment/build_types.dart';
import 'package:todo_with_bloc/src/core/config/environment/environment.dart';
import 'package:todo_with_bloc/src/core/config/urls.dart';

void main() async {
  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Url.devUrl,
    ),
  );
  await run();
}
