String concatenateString({String text, int maxLength = 16}) {
  return text.length >= maxLength
      ? '${text.substring(0, maxLength - 3)}...'
      : text;
}
