import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  //! Login
  Future<Either<String, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return const Right('Login Succesfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('No user found');
      } else if (e.code == 'wrong-password') {
        return const Left('Wrong Password');
      } else {
        return Left(e.toString());
      }
    }
  }

  //! Sign Up
  Future<Either<String, String>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return const Right('Email Created Successfuly');
    } on FirebaseAuthException catch (e) {
      return Left(e.toString());
    }
  }

  //! Reset Password
  Future<Either<String, String>> resetPass({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Code Send to Your Email');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('No user found');
      } else {
        return Left(e.toString());
      }
    }
  }
}
