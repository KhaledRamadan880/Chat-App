import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  //! Login
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final res = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .get();
      return Right(UserModel.fromJson(res.data()!));
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
    required String name,
    required String phone,
    required String department,
  }) async {
    try {
      final userAccount = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userAccount.user!.uid)
          .set({
        'name': name,
        'email': email,
        'phone': phone,
        'department': department,
        'uid': userAccount.user!.uid,
      });
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
