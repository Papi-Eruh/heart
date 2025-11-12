/// True when we should use woman voice for [date].
bool shouldUseWomanVoice(DateTime date) {
  return (date.day + date.month).isEven;
}
