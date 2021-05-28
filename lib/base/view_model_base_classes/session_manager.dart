// import 'package:meta/meta.dart';

// import '../../app_dependencies.dart';
// import '../../services/local_storage_service.dart';
// import '../../utilities/constants/constants.dart';
// import '../data_base_classes/data_base_classes.dart';

// class SessionManager {
//   final LocalStorageService store;

//   // String _token;
//   bool _sessionIsOpen = false;
//   bool get isOpen => _sessionIsOpen;
//   UserModel get currentUser => _currentUser;
//   UserModel _currentUser;

//   SessionManager({
//     @required this.store,
//   });

//   void initSession({@required AuthTokenModel token, UserModel user}) {
//     // _token = token;
//     BaseDatasource.token = token;
//     if (user != null) {
//       _currentUser = user;
//       // store.setBool(firstLaunchStorageKey, false);
//       store.setString(
//         userAuthTypeStorageKey,
//         _currentUser.authType.index.toString(),
//       );
//     }
//     store.setString(tokenStorageKey, token.refreshToken);
//     _sessionIsOpen = true;
//   }

//   Future<void> closeSession() async {
//     if (_sessionIsOpen) {
//       // _token = '';
//       BaseDatasource.token = AuthTokenModel.empty;
//       _currentUser = null;
//       _sessionIsOpen = false;
//       await AppDependencies.locate.reset();
//     }
//   }

//   bool updateUser(UserModel user) {
//     if (_sessionIsOpen) {
//       _currentUser = user;
//       if (_currentUser == null) closeSession();
//       return true;
//     } else
//       return false;
//   }
// }
