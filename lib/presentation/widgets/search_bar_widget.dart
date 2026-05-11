
import 'dart:async';
import 'package:english_dictionary/core/theme/app_colors.dart';
import 'package:english_dictionary/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SearchBarWidget extends ConsumerStatefulWidget {
 
  final ValueChanged<String> onSubmitted;

  const SearchBarWidget({super.key, required this.onSubmitted});

  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();

    if (value.trim().isEmpty) {
      ref.read(searchProvider.notifier).clear();
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 300), () {
      ref.read(searchProvider.notifier).search(value.trim());
    });
  }

  void _onClear() {
    _controller.clear();
    _focusNode.requestFocus();
    ref.read(searchProvider.notifier).clear();
  }

  void _onSubmit(String value) {
    _debounce?.cancel(); 
    final trimmed = value.trim();
    if (trimmed.isNotEmpty) {
      widget.onSubmitted(trimmed);
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: _onChanged,
      onSubmitted: _onSubmit,
      textInputAction: TextInputAction.search,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: 'Search a word...',
        prefixIcon: Icon(Icons.search_rounded, color: colors.textHint),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (_, value, _) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: Icon(Icons.close_rounded, color: colors.textHint),
              onPressed: _onClear,
              splashRadius: 18,
            );
          },
        ),
      ),
    );
  }
}