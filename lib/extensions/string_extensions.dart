extension StringExtension on String {
  String capitalizeFirstWord() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
