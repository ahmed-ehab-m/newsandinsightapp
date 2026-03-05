class ErrorMessages {
  // API ERRORS
  static const String noInternetConnection =
      "No internet connection. Please check your network to read the latest news.";

  static const String connectionTimedOut =
      "Connection timed out. The news feed is taking too long to load.";

  static const String resourceNotFound =
      "Article not found. It might have been removed or the link is broken.";

  static const String internalServerError =
      "We're experiencing server issues. Our team is working on getting the news back online.";

  static const String unauthorizedAccess =
      "Unauthorized access. Please log in to view this content.";

  static const String genericError =
      "Something went wrong while loading the news. Please try again later.";

  // LOCAL STORAGE ERRORS
  static const String localDataSourceError =
      "Failed to access your saved articles. Please restart the app.";

  static const String hiveBoxError =
      "Storage error. Unable to open your bookmarks.";

  static const String hiveFailedToSaveData =
      "Failed to add the article to your favorites. Please try again.";

  static const String hiveFailedToRetrieveData =
      "Failed to load your favorite articles.";

  static const String hiveFailedToDeleteData =
      "Failed to remove the article from your favorites.";

  static const String hiveFailedToClearData =
      "Failed to clear your bookmarked articles.";

  // GENERIC ERRORS
  static const String unexpectedError =
      "An unexpected error occurred. Please try again.";

  static const String requestCancelled = "Request cancelled.";

  static const String forbiddenRequest =
      "Access denied to this article or source.";

  static const String badRequestPrefix =
      "Invalid request. Please refresh the page.";

  static const String aborted = "Process aborted. Please try again.";

  static const String databaseError =
      "Failed to read the local database. Your saved articles might be temporarily unavailable.";
}
