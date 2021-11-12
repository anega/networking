import 'package:flutter/cupertino.dart';
import 'package:networking/domain/api/api_client.dart';
import 'package:networking/domain/entity/post.dart';

class ExampleWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _posts = const <Post>[];

  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    _posts += await apiClient.getPosts();
    notifyListeners();
  }

  void createPost() async {
  //   final result = await apiClient.createPost(
  //     title: 'First created post',
  //     body: 'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non',
  //   );
  }
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
        ?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }
}
