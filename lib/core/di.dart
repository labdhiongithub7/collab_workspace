import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/controller/auth_cubit.dart';
import '../features/boards/controller/board_cubit.dart';
import '../features/task/controller/task_cubit.dart';
import '../features/workspace/controller/workspace_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Firebase Auth (singleton)
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // FirebaseFirestore (singleton)
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // AuthCubit
  sl.registerSingleton<AuthCubit>(
    AuthCubit(
      firebaseAuth: sl<FirebaseAuth>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );

  // WorkSpaceCubit
  sl.registerFactory<WorkSpaceCubit>(
    () => WorkSpaceCubit(
      firebaseAuth: sl<FirebaseAuth>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );

  // BoardCubit
  sl.registerFactory<BoardCubit>(
    () => BoardCubit(
      firebaseAuth: sl<FirebaseAuth>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );

  // TaskCubit
  sl.registerFactory<TaskCubit>(
    () => TaskCubit(
      firebaseAuth: sl<FirebaseAuth>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );
}
