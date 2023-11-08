import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../models/user_model.dart';
import '../../../utils/exceptions/network/custom.exception.dart';

@LazySingleton()
class SecurityRemoteDataSource {
  final usersRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshots, _) => UserModel.fromJson(snapshots.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  Future<UserModel?> getUser(String id) async {
    var userDocSnap = await usersRef.doc(id).get();
    return userDocSnap.data();
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  }) async {
    var userQuerySnap = await usersRef.where("email", isEqualTo: email).get();

    if (userQuerySnap.size != 0) {
      throw CustomException();
    }

    var id = const Uuid().v1();

    UserModel userModel = UserModel(
      id: id,
      email: email,
      password: sha256.convert(utf8.encode(password)).toString(),
      fullName: fullName,
      userName: userName,
      createdAt: DateTime.now(),
    );

    await usersRef.doc(id).set(userModel);
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    var userQuerySnap = await usersRef.where("email", isEqualTo: email).get();

    if (userQuerySnap.size <= 0) {
      return false;
    }

    if (userQuerySnap.docs[1].data().password ==
        sha256.convert(utf8.encode(password)).toString()) {
      return true;
    }

    return false;
  }
}
