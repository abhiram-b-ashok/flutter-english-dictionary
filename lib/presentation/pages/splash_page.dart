
import 'package:english_dictionary/core/theme/app_colors.dart';
import 'package:english_dictionary/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initAndNavigate();
  }


  Future<void> _initAndNavigate() async {
    final store = ref.read(sembastStoreProvider);
    final alreadySeeded = await store.isBundledAdded();
    if (!alreadySeeded) {
      await store.addBundledDictionary();
    }

    await Future.delayed(const Duration(milliseconds: 2200));

    if (mounted) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: colors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: colors.onPrimary.withValues(alpha: .15),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                Icons.menu_book_rounded,
                size: 48,
                color: colors.onPrimary,
              ),
            )
                .animate()
                .scale(
                  begin: const Offset(0.4, 0.4),
                  duration: 700.ms,
                  curve: Curves.elasticOut,
                )
                .fadeIn(duration: 400.ms),

            const SizedBox(height: 24),

            Text(
              'AngLingo',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
            )
                .animate(delay: 300.ms)
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.3, end: 0, curve: Curves.easeOutCubic),

            const SizedBox(height: 8),

            Text(
              'Your offline English dictionary',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colors.onPrimary.withValues(alpha: .75),
                  ),
            ).animate(delay: 600.ms).fadeIn(duration: 500.ms),

            const SizedBox(height: 60),

            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: colors.onPrimary.withValues(alpha: .6),
              ),
            ).animate(delay: 800.ms).fadeIn(duration: 400.ms),
          ],
        ),
      ),
    );
  }
}