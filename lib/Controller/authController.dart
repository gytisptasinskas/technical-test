import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scale3c/Views/Authentication/sign_in_view.dart';
import 'package:scale3c/Views/Home/home_view.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Rx<User?> _user = Rx<User?>(null);

  User? get currentUser => _user.value;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  Future<void> signIn(String email, String password) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.off(() => HomeView());
    } catch (error) {
      displayError(error);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'uid': userCredential.user!.uid,
        });
      }
    } catch (error) {
      displayError(error);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.off(() => SignInView());
    } finally {
      isLoading.value = false;
    }
  }

  void displayError(dynamic error) {
    String errorMessage;
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          errorMessage = 'No user found for this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for this user.';
          break;
        case 'email-already-in-use':
          errorMessage = 'This email is already in use.';
          break;
        default:
          errorMessage = error.message ??
              'An unexpected error occurred. Please try again.';
      }
    } else {
      errorMessage = 'An unexpected error occurred. Please try again.';
    }
    Get.snackbar('Error', errorMessage);
  }
}
