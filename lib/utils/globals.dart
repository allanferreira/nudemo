/// Global Variables in Dart (without third party plugin!)
library nudemo.globals;

// Settings data
bool isLoggedIn = false;

// Customer data
String userUuid;
String userName;
String userNickname;
String userEmail;
String userPhone;

// Account data
String accountUuid;
String bankBranch;
String bankAccount;
double accountLimit = 0.0;

// Balances control
double balancesOpenValue = 0.0;
double balancesOpenPercent = 0.0;
int balancesOpenFlex = 0;
double balancesAvailableValue = 0.0;
double balancesAvailablePercent = 0.0;
int balancesAvailableFlex = 0;
// We don't cover balancesFuture and balancesDue in this demo!
double limitValue = accountLimit;
double limitPercent = 100.0;
double balancesFutureValue = 0.0;
double balancesFuturePercent = 0.0;
int balancesFutureFlex = 0;
double balancesDueValue = 0.0;
double balancesDuePercent = 0.0;
int balancesDueFlex = 0;
