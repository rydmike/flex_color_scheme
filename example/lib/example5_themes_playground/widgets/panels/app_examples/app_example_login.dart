import 'package:flutter/material.dart';

import '../../../../shared/const/app_images.dart';
import '../../../../shared/widgets/universal/svg_asset_image.dart';

/// An example that show what an app using the theme might look like
class AppExampleLogin extends StatelessWidget {
  const AppExampleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      body: const LoginColumn(),
    );
  }
}

class LoginColumn extends StatelessWidget {
  const LoginColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                labelText: 'Email',
                hintText: 'Enter your email address',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                labelText: 'Password',
                hintText: 'Minimum 8 chars',
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 200,
                child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: textTheme.titleMedium!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: SvgAssetImage(
                assetName: AppImages.verified,
                color: theme.colorScheme.primary,
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
