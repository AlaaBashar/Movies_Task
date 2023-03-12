import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  final Widget child ;
  const LayoutBuilderWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints){
      return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight
          ),
          child: IntrinsicHeight(
            child: child,
          ),
        ),
      );
    }
    );
  }
}

