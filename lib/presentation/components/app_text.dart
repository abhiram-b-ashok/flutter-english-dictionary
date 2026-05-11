
import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const DisplayText(this.text, {super.key, this.textAlign});

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.displayMedium,
      );
}

class HeadlineText extends StatelessWidget {
  final String text;
  final Color? color;
  const HeadlineText(this.text, {super.key, this.color});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: color),
      );
}

class TitleText extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const TitleText(this.text, {super.key, this.color, this.maxLines});

  @override
  Widget build(BuildContext context) => Text(
        text,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: color),
      );
}

class BodyText extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  const BodyText(this.text, {super.key, this.color, this.maxLines});

  @override
  Widget build(BuildContext context) => Text(
        text,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: color),
      );
}

class ExampleText extends StatelessWidget {
  final String text;
  const ExampleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '"$text"',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontStyle: FontStyle.italic,
          ),
    );
  }
}

class CaptionText extends StatelessWidget {
  final String text;
  final Color? color;
  const CaptionText(this.text, {super.key, this.color});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: color),
      );
}