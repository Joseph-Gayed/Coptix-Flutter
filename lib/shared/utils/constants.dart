const String imagesPath = "assets/images/";
const String fakeImagesPath = "assets/images/fake/";
const String passwordValidationRegex =
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$';
const int passwordMinAllowedCharacter = 6;
const int paginationDefaultFirstPage = 1;
const int searchDebounceMinChars = 3;
const int searchThrottleMinSeconds = 1;
const int cacheExpirationHours = 24;
