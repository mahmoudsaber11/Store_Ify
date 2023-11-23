import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_ify/core/api/app_interceptors.dart';
import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/helpers/cache_helper.dart';
import 'package:store_ify/core/network/network_info.dart';
import 'package:store_ify/core/network/network_info_impl.dart';
import 'package:store_ify/features/auth/data/repositories/forget_password/forget_password_repo.dart';
import 'package:store_ify/features/auth/data/repositories/forget_password/forget_password_repo_impl.dart';
import 'package:store_ify/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:store_ify/features/auth/data/repositories/login/login_repo.dart';
import 'package:store_ify/features/auth/data/repositories/login/login_repo_impl.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:store_ify/features/auth/data/repositories/reset_password/reset_password_repo.dart';
import 'package:store_ify/features/auth/data/repositories/reset_password/reset_password_repo_impl.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:store_ify/features/auth/data/repositories/sign_up/sign_up_repo.dart';
import 'package:store_ify/features/auth/data/repositories/sign_up/sign_up_repo_impl.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:store_ify/features/auth/data/repositories/verification/verification_repo.dart';
import 'package:store_ify/features/auth/data/repositories/verification/verification_repo_impl.dart';
import 'package:store_ify/features/auth/presentation/cubits/verification/verification_cubit.dart';
import 'package:store_ify/features/layout/data/repositories/layout_repo.dart';
import 'package:store_ify/features/layout/data/repositories/layout_repo_impl.dart';
import 'package:store_ify/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:store_ify/features/on_boarding/data/repositories/on_boarding_repo.dart';
import 'package:store_ify/features/on_boarding/data/repositories/on_boarding_repo_impl.dart';
import 'package:store_ify/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    await _setupForExternal();

    _setupForCore();

    _setupForRepos();

    _setupForCubits();
  }

  Future<void> _setupForExternal() async {
    serviceLocator.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    serviceLocator
        .registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    serviceLocator.registerLazySingleton<AppInterceptors>(
      () => AppInterceptors(),
    );

    serviceLocator.registerLazySingleton<LogInterceptor>(
      () => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );

    serviceLocator.registerLazySingleton<Dio>(() => Dio());
  }

  void _setupForCore() {
    serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(
        connectionChecker: serviceLocator.get<InternetConnectionChecker>(),
      ),
    );

    serviceLocator.registerLazySingleton<CacheHelper>(
      () => CacheHelper(serviceLocator<SharedPreferences>()),
    );

    serviceLocator.registerLazySingleton<DioConsumer>(
        () => DioConsumer(serviceLocator.get()));
  }

  void _setupForRepos() {
    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());

    serviceLocator.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepoImpl(
        dioConsumer: serviceLocator.get<DioConsumer>(),
      ),
    );
    serviceLocator.registerLazySingleton<LoginRepo>(
        () => LoginRepoImpl(dioConsumer: serviceLocator.get<DioConsumer>()));
    serviceLocator.registerLazySingleton<SignUpRepo>(
        () => SingUpRepoImpl(dioConsumer: serviceLocator.get<DioConsumer>()));
    serviceLocator.registerLazySingleton<VerificationRepo>(() =>
        VerificationRepoImpl(dioConsumer: serviceLocator.get<DioConsumer>()));
    serviceLocator.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepoImpl(
        dioConsumer: serviceLocator.get<DioConsumer>(),
      ),
    );
    serviceLocator.registerLazySingleton<LayoutRepo>(() => LayoutRepoImpl());
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<OnBoardingCubit>(
      () =>
          OnBoardingCubit(onBoardingRepo: serviceLocator.get<OnBoardingRepo>()),
    );

    serviceLocator.registerFactory<ForgetPasswordCubit>(() =>
        ForgetPasswordCubit(
            forgetPasswordRepo: serviceLocator.get<ForgetPasswordRepo>()));
    serviceLocator.registerFactory<LoginCubit>(
        () => LoginCubit(loginRepo: serviceLocator.get<LoginRepo>()));
    serviceLocator.registerFactory<SignUpCubit>(
        () => SignUpCubit(registerRepo: serviceLocator.get<SignUpRepo>()));
    serviceLocator.registerFactory<VerificationCubit>(() => VerificationCubit(
        verificationRepo: serviceLocator.get<VerificationRepo>()));
    serviceLocator.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(
        resetPasswordRepo: serviceLocator.get<ResetPasswordRepo>()));
    serviceLocator.registerFactory<LayoutCubit>(
        () => LayoutCubit(layoutRepo: serviceLocator.get<LayoutRepo>()));
  }
}
