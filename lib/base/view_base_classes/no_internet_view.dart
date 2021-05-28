import 'package:flutter/material.dart';
import 'style/style.dart';

import 'widgets/simple_text.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({
    Key key,
    @required this.retryCallback,
  }) : super(key: key);

  final Function retryCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, -0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 40,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FractionallySizedBox(
                widthFactor: 0.4,
                child: FittedBox(
                  child: Icon(
                    Icons.wifi,
                    color: textWhiteColor,
                    size: 64,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const SimpleText(
                'No Internet Connection',
                size: 24,
                color: droPurpleColor,
                weight: FontWeight.w700,
              ),
              const SizedBox(height: 54),
            ],
          ),
        ),
      ),
    );
  }
}
