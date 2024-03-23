// ignore_for_file: lines_longer_than_80_chars

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import 'users_repository_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  static String uid = '';

  @override
  Future<Either<String, User?>> signup({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String career,
    required String studentCode,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'name': name,
        'phone': phone,
        'career': career,
        'studentCode': studentCode,
        'type': 'student'
      });
      uid = credential.user!.uid;
      UsersRepositoryImpl userData = UsersRepositoryImpl();
      await userData.getUser(uid);
      return Right(credential.user);
    } catch (e) {
      return const Left<String, User?>(
        'No se pudo Crear el usuario, intentelo más tarde',
      );
    }
  }

  @override
  Future<Either<String, User?>> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      uid = credential.user!.uid;
      return Right<String, User?>(credential.user);
    } catch (e) {
      return const Left<String, User?>(
        'No se pudo iniciar sesión, intentelo más tarde',
      );
    }
  }

  String getuid() => uid;
}