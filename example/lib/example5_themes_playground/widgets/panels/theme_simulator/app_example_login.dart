import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/const/app_images.dart';
import '../../../../shared/widgets/universal/svg_asset_image.dart';

// Set the bool flag to true to show debug prints. Even if it is forgotten
// to set it to false, debug prints will not show in release builds.
// The handy part is that if it gets in the way in debugging, it is an easy
// toggle to turn it off here too. Often I just leave them true if it is one
// I want to see in dev mode, unless it is too chatty.
const bool _debug = !kReleaseMode && false;

/// An example that show what an app using the theme might look like
class AppExampleLogin extends StatelessWidget {
  const AppExampleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginColumn(),
    );
  }
}

class LoginColumn extends StatefulWidget {
  const LoginColumn({super.key});

  @override
  State<LoginColumn> createState() => _LoginColumnState();
}

class _LoginColumnState extends State<LoginColumn> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Function to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const int numberOfPoints = 5;
    final double halfWidth = size.width / 2;
    final double externalRadius = halfWidth;
    final double internalRadius = halfWidth / 2.5;
    final double degreesPerStep = degToRad(360 / numberOfPoints);
    final double halfDegreesPerStep = degreesPerStep / 2;
    final Path path = Path();
    final double fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final Size mediaSize = MediaQuery.sizeOf(context);
    final bool useTwoColumns = mediaSize.height < 500;
    final double spaceFactor = useTwoColumns ? 0.5 : 1;

    if (_debug) debugPrint('Media size $mediaSize');

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 600),
          child: Padding(
            padding: EdgeInsets.all(24.0 * spaceFactor),
            child: Row(
              children: <Widget>[
                if (useTwoColumns) ...<Widget>[
                  const SizedBox(height: 32),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 300),
                    child: SvgAssetImage(
                      assetName: AppImages.verified,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ] else
                  const SizedBox.shrink(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(flex: useTwoColumns ? 1 : 2),
                      Text(
                        'Sign In',
                        style: textTheme.headlineLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'No account?',
                            style: textTheme.bodyLarge,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Make account'),
                          ),
                        ],
                      ),
                      SizedBox(height: 8 * spaceFactor),
                      const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          labelText: 'Email',
                          hintText: 'Enter your email address',
                        ),
                      ),
                      SizedBox(height: 16 * spaceFactor),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          labelText: 'Password',
                          hintText: 'Minimum 8 chars',
                        ),
                      ),
                      SizedBox(height: 8 * spaceFactor),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                      SizedBox(height: 16 * spaceFactor),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: FilledButton(
                            onPressed: () {
                              _confettiController.play();
                            },
                            child: ConfettiWidget(
                              confettiController: _confettiController,
                              numberOfParticles: 20,
                              blastDirectionality:
                                  BlastDirectionality.explosive,
                              shouldLoop: false,
                              colors: const <Color>[
                                Colors.green,
                                Colors.blue,
                                Colors.pink,
                                Colors.red,
                                Colors.indigo,
                                Colors.orange,
                                Colors.purple
                              ],
                              createParticlePath: drawStar,
                              canvas: Size.infinite,
                              child: Text(
                                'Sign In',
                                style: textTheme.titleMedium!.copyWith(
                                    color: theme.colorScheme.onPrimary),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (!useTwoColumns) ...<Widget>[
                        const Spacer(),
                        Expanded(
                          flex: 10,
                          child: SvgAssetImage(
                            assetName: AppImages.verified,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const Spacer(),
                      ] else
                        const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
