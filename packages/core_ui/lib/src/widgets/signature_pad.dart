import 'dart:ui' show PointMode;

import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/spacing_tokens.dart';

/// Поле для подписи принимающего пальцем.
///
/// Подпись подтверждает передачу ребёнка, когда кода учреждения нет
/// (MVP_PLAN §7). Сам рисунок пока не сохраняется — в S3 важен факт
/// подписи; отправка изображения появится вместе с фото передачи.
class SignaturePad extends StatefulWidget {
  const SignaturePad({super.key, required this.onChanged, this.height = 180});

  /// true, когда на поле появился хотя бы один штрих.
  final ValueChanged<bool> onChanged;
  final double height;

  @override
  State<SignaturePad> createState() => SignaturePadState();
}

class SignaturePadState extends State<SignaturePad> {
  final _strokes = <List<Offset>>[];

  void clear() {
    setState(_strokes.clear);
    widget.onChanged(false);
  }

  void _start(Offset point) {
    setState(() => _strokes.add([point]));
    widget.onChanged(true);
  }

  void _extend(Offset point) {
    if (_strokes.isEmpty) return;
    setState(() => _strokes.last.add(point));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: scheme.surface,
        border: Border.all(color: scheme.outline),
        borderRadius: BorderRadius.circular(ChildRadius.card),
      ),
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onPanStart: (details) => _start(details.localPosition),
        onPanUpdate: (details) => _extend(details.localPosition),
        child: CustomPaint(
          painter: _SignaturePainter(_strokes, scheme.onSurface),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  _SignaturePainter(this.strokes, this.color);

  final List<List<Offset>> strokes;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (final stroke in strokes) {
      if (stroke.length < 2) {
        if (stroke.isNotEmpty) {
          canvas.drawPoints(PointMode.points, stroke, paint);
        }
        continue;
      }
      final path = Path()..moveTo(stroke.first.dx, stroke.first.dy);
      for (final point in stroke.skip(1)) {
        path.lineTo(point.dx, point.dy);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_SignaturePainter oldDelegate) => true;
}

/// Плашка «N событий ждут отправки» — водителю видно, что связь пропала.
class PendingEventsBadge extends StatelessWidget {
  const PendingEventsBadge({
    super.key,
    required this.text,
    required this.isPending,
    this.onRetry,
    this.retryLabel,
  });

  final String text;
  final bool isPending;
  final VoidCallback? onRetry;
  final String? retryLabel;

  @override
  Widget build(BuildContext context) {
    final color = isPending ? ChildColors.warning : ChildColors.success;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ChildSpacing.m,
        vertical: ChildSpacing.s,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(ChildRadius.button),
      ),
      child: Row(
        children: [
          Icon(isPending ? Icons.cloud_upload : Icons.cloud_done, color: color),
          const SizedBox(width: ChildSpacing.s),
          Expanded(child: Text(text)),
          if (isPending && onRetry != null)
            TextButton(onPressed: onRetry, child: Text(retryLabel ?? '↻')),
        ],
      ),
    );
  }
}
