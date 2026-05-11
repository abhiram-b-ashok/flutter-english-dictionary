
import 'package:english_dictionary/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colors.onPrimary,
                ),
              )
            : Text(label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.w700,
                    )),
      ),
    );
  }
}

class OutlinedAppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  const OutlinedAppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, size: 18) : const SizedBox.shrink(),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.primary,
        side: BorderSide(color: colors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}


class PartOfSpeechBadge extends StatelessWidget {
  final String partOfSpeech;
  const PartOfSpeechBadge(this.partOfSpeech, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      decoration: BoxDecoration(
        color: colors.partOfSpeechBg,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        partOfSpeech,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: colors.partOfSpeechText,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
      ),
    );
  }
}

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 6),
      color: colors.offlineBanner,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off_rounded, size: 14,
              color: colors.offlineBannerText),
          const SizedBox(width: 6),
          Text(
            'You\'re offline — showing cached results',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.offlineBannerText,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}


class SourceBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  const SourceBadge({super.key, required this.label, required this.icon});

  factory SourceBadge.remote() => const SourceBadge(
        label: 'live',
        icon: Icons.language_rounded,
      );

  factory SourceBadge.cache() => const SourceBadge(
        label: 'cached',
        icon: Icons.storage_rounded,
      );

  factory SourceBadge.bundled() => const SourceBadge(
        label: 'offline',
        icon: Icons.download_done_rounded,
      );

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: colors.sourceBadgeBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.primary.withValues(alpha: .3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: colors.sourceBadgeText),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.sourceBadgeText,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}


class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return Divider(
      color: colors.divider,
      thickness: 1,
      height: 32,
    );
  }
}