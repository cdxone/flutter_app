class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel(
      {this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  // 工厂构造方法增加一个factory的关键字
  // 工厂构造方法和别的构造方法不一样的就是，工厂构造方法可以返回一个对象
  factory CommonModel.formJson(Map<String, dynamic> json) {
    return CommonModel(
        icon: json['icon'],
        title: json['title'],
        url: json['json'],
        statusBarColor: json['statusBarColor'],
        hideAppBar: json['hideAppBar']);
  }

  @override
  String toString() {
    return 'CommonModel{icon: $icon, title: $title, url: $url, statusBarColor: $statusBarColor, hideAppBar: $hideAppBar}';
  }
}
