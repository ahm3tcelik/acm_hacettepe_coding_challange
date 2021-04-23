import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;

  static VexanaManager get instance {
    _instace ??= VexanaManager._init();
    return _instace!;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    fileManager: LocalSembast(),
    options: BaseOptions(
      baseUrl: env['BASE_URL']!,
    ),
  );
}