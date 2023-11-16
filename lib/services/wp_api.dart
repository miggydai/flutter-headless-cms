import 'package:wordpress_client/wordpress_client.dart';

class WP_Api {
  final myclient = WordpressClient(
      baseUrl: Uri.parse("https://www.addu.edu.ph/wp-json/wp/v2/"),
      bootstrapper: (bootstrapper) => bootstrapper.withDebugMode(true).build());

  WP_Api() {
    myclient.initialize();
  }
}
