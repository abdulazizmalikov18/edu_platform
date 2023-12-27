import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

class Paginator extends StatelessWidget {
  final FormzStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget? errorWidget;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;
  final Widget? loadingWidget;
  final ScrollPhysics? physics;
  final bool reverse;
  final ScrollController? controller;

  const Paginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    this.errorWidget,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.loadingWidget,
    this.physics,
    Key? key,
    this.reverse = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == FormzStatus.submissionInProgress) {
      return loadingWidget ?? const Center(child: CupertinoActivityIndicator());
    } else if (paginatorStatus == FormzStatus.submissionFailure) {
      return errorWidget ?? const SizedBox();
    } else {
      return ListView.separated(
        scrollDirection: scrollDirection,
        physics: physics ?? const BouncingScrollPhysics(),
        padding: padding,
        reverse: reverse,
        controller: controller,
        itemBuilder: (context, index) {
          if (index == itemCount) {
            if (hasMoreToFetch) {
              fetchMoreFunction();
              return const Center(child: CupertinoActivityIndicator());
            } else {
              return const SizedBox();
            }
          }
          return itemBuilder(context, index);
        },
        separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox(),
        itemCount: itemCount + 1,
      );
    }
  }
}
