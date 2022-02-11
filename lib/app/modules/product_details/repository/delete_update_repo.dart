import 'package:dartz/dartz.dart';
import 'package:trail/app/core/domain/failures/server_failures/firestore_failures.dart';

abstract class IDeleteOrUpdateRep {
  // DeletePost
  Future< Option<FireStoreServerFailures>>deleteThePost({required String id});
  // Delete Images
  Future< Option<FireStoreServerFailures>>deleteTheImages({required String id});
}