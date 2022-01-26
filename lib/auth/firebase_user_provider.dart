import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class GovtAppFirebaseUser {
  GovtAppFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

GovtAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<GovtAppFirebaseUser> govtAppFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<GovtAppFirebaseUser>(
        (user) => currentUser = GovtAppFirebaseUser(user));
