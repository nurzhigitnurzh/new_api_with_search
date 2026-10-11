String formatDate(String? iso) {
  final date = DateTime.tryParse(iso ?? '')?.toLocal();
  if (date == null) return '';
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(date.day)}.${two(date.month)}.${date.year}';
}

String formatTime(String? iso) {
  final date = DateTime.tryParse(iso ?? '')?.toLocal();
  if (date == null) return '';
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(date.hour)}:${two(date.minute)}';
}