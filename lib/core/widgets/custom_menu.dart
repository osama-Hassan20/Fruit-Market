import 'package:flutter/material.dart';

class MyPopupMenuItem<T> extends PopupMenuItem<T> {

  const MyPopupMenuItem({super.key, required this.childWidget, required this.onClick})
      : super(child: childWidget);
  final Widget childWidget;
  final Function onClick;
  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }
}

class MyPopupMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  @override
  void handleTap() {
    widget.onClick();
  }
}