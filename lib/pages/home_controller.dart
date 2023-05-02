part of 'home.dart';

extension ExtHome on _HomeState {
  void _loadPosts() async {
    final posts = await PostService.getPosts();
    setState(() {
      _posts = posts;
    });
  }

  void _updatedataState(int index) async {
    final posts = _posts[index];

    await PostService.update(posts);
    setState(() {
      _posts[index] = posts;
    });
  }

  void _adddata() async {
    final data = Post(
      title: _titleController.text,
      completed: false,
    );
    final newdata = await PostService.create(data);
    setState(() {
      _posts.add(newdata);
      _titleController.clear();
    });
  }

  void _deletedata(int index) async {
    final posts = _posts[index];
    await PostService.delete(posts.id as int);
    setState(() {
      _posts.removeAt(index);
    });
  }

  void _searchFilter(String enteredKeyword) async {
    if (enteredKeyword.isEmpty) {
      searchPosts = [];
      print(searchPosts);
    } else {
      searchPosts = _posts
          .where((element) => element.title!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {});
  }
}
