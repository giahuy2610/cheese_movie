class RecentMovie {
  var slug;
  var durationInSeconds;
  var positionInSeconds;
  var timestamp;
  var episode;

  RecentMovie(
      this.slug, this.episode, this.durationInSeconds, this.positionInSeconds) {
    timestamp = DateTime.now().millisecondsSinceEpoch;
  }

  String convertToString() {
    return '$slug#+_|$episode#+_|$durationInSeconds#+_|$positionInSeconds#+_|$timestamp#_@';
  }
}
