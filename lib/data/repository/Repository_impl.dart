import 'dart:convert';
import 'package:dartz/dartz.dart';
import '/app/di.dart';
import '/app/extension.dart';
import '/data/request/customer_api_request.dart';
import '/app/functions.dart';
import '/data/request/kiano_api_request.dart';
import '/domain/model/model.dart';
import '/data/data_source/local_data_source.dart';
import '/app/app_prefs.dart';
import '/data/mapper/mapper.dart';
import '/data/data_source/remote_data_source.dart';
import '/data/network/failure.dart';
import '/data/network/network_info.dart';
import '/data/request/japo_api_request.dart';
import '/domain/repository/repository.dart';
import '../network/error_handler.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _netWorkInfo;
  final AppPreferences _appPreferences;

  RepositoryImpl(this._remoteDataSource, this._netWorkInfo,
      this._localDataSource, this._appPreferences);

  Future<Either<Failure, T>> repositoryHandler<T>(
      Future<Either<Failure, T>> Function() repoFunc) async {
    if (await _netWorkInfo.isConnected) {
      try {
        return await repoFunc();
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> appLogin() async {
    return await repositoryHandler<bool>(() async {
      final response = await _remoteDataSource
          .appLogin(AppLoginRequest(_appPreferences.getPhoneNumber()));
      if (response.isOk ?? false) {
        await _appPreferences.setUserId(response.data!.userId!);
        await _appPreferences.setToken(response.data!.token!);
        await _appPreferences.setRefreshToken(response.data!.refreshToken!);
        await _appPreferences.setProfileImage(response.data!.profileImage!);
        await _appPreferences
            .setUserDisplayName(response.data!.userDisplayName!);
        await _appPreferences.setUserRole(response.data!.userRole!);
        await _appPreferences.setUserRoleName(response.data!.userRoleName!);
        await _appPreferences.setPhoneNumber(response.data!.phoneNumber!);
        await _appPreferences.setUserLoggedIn();
        return const Right(true);
      }
      return const Right(false);
    });
  }

  @override
  Future<Either<Failure, bool>> checkConfirmCode(String confirmCode) async {
    return await repositoryHandler<bool>(() async {
      final response = await _remoteDataSource.checkConfirmCode(
          CheckConfirmCodeRequest(
              _appPreferences.getPhoneNumber(), confirmCode));
      if ((response.isOk ?? false) && response.message == "Ok") {
        return const Right(true);
      }
      return const Right(false);
    });
  }

  @override
  Future<Either<Failure, bool>> sendChangeDeviceCode() async {
    final deviceInfo = await getDeviceDetails();
    return await repositoryHandler<bool>(() async {
      final response = await _remoteDataSource.sendChangeDeviceCode(
          SendChangeDeviceCodeRequest(
              _appPreferences.getPhoneNumber(),
              deviceInfo.identifier,
              deviceInfo.deviceName,
              deviceInfo.deviceType));
      if (response.isOk ?? false) {
        return const Right(true);
      }
      return const Right(false);
    });
  }

  @override
  Future<Either<Failure, bool>> sendVerificationCode(String phoneNumber) async {
    final deviceInfo = await getDeviceDetails();
    await _appPreferences.setPhoneNumber(phoneNumber);
    return await repositoryHandler<bool>(() async {
      final response = await _remoteDataSource.sendVerificationCode(
          SendVerificationCodeRequest(phoneNumber, deviceInfo.deviceName,
              deviceInfo.identifier, deviceInfo.deviceType));
      if ((response.isOk ?? false) && response.message == "Ok") {
        if (response.data!.allowGoNextStep ?? false) {
          return const Right(true);
        } else {
          switch (response.data!.operationResult) {
            case "mac-has-changed":
              return const Right(false);
          }
        }
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<Company>>> getKianoAccessListCompany() async {
    return await repositoryHandler<List<Company>>(() async {
      var response = await _remoteDataSource.getKianoAccessList(
          KianoAccessListRequest(_appPreferences.getPhoneNumber()));
      if ((response.isOk ?? false) && response.message == "Ok") {
        if (response.data?.hasAccessedCompany ?? false) {
          _appPreferences.setCompanyAccessList(jsonEncode(response.data));
          return Right(response.data?.toDomain() ?? []);
        }
        return Left(Failure(ApiInternalStatus.FAILURE,
            "هنوز هیچ شرکتی در لیست شرکت های شما ثبت نشده!"));
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<FiscalYear>>> getCompanyFiscalYear(
      String address) async {
    updateDioBaseUrl(address);
    return await repositoryHandler<List<FiscalYear>>(() async {
      var response = await _remoteDataSource.getCompanyFiscalYear();
      if (response.message == "Ok") {
        return Right(response.data?.toDomain() ?? []);
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, bool>> fiscalYearDataBaseAuth(
      FiscalYearDataBaseAuthRequest request) async {
    return await repositoryHandler<bool>(() async {
      var response = await _remoteDataSource.dbAuth(request);
      if (response.message == "Ok") {
        return const Right(true);
      } else if (response.message ==
          "نام کاربری یا رمز عبور را اشتباه وارد کرده اید") {
        return Left(Failure(ApiInternalStatus.INCORRECT_USERNAME_OR_PASSWORD,
            response.message!));
      } else if (response.message != null) {
        return const Right(false);
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, MaterialDailySummaryRep>> materialDailySummaryRep(
      MaterialDailySummaryRepRequest request) async {
    return await repositoryHandler<MaterialDailySummaryRep>(() async {
      var response = await _remoteDataSource.materialDailySummaryRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialBillRep>>> materialBillRep(
      MaterialBillRepRequest request) async {
    return await repositoryHandler<List<MaterialBillRep>>(() async {
      var response = await _remoteDataSource.materialBillRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialBillRepByCustomer>>>
      materialBillRepByCustomer(
          MaterialBillRepByCustomerRequest request) async {
    return await repositoryHandler<List<MaterialBillRepByCustomer>>(() async {
      var response = await _remoteDataSource.materialBillRepByCustomer(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialBillRepByCar>>> materialBillRepByCar(
      MaterialBillRepByCarRequest request) async {
    return await repositoryHandler<List<MaterialBillRepByCar>>(() async {
      var response = await _remoteDataSource.materialBillRepByCar(request);
      if (response.hasData ?? false) {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialDetailedIncomingRep>>>
      materialDetailedIncomingRep(
          MaterialDetailedIncomingRepRequest request) async {
    return await repositoryHandler<List<MaterialDetailedIncomingRep>>(() async {
      var response =
          await _remoteDataSource.materialDetailedIncomingRep(request);
      if (response.hasData ?? false) {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialBillRepByProduct>>>
      materialBillRepByProduct(MaterialBillRepByProductRequest request) async {
    return await repositoryHandler<List<MaterialBillRepByProduct>>(() async {
      var response = await _remoteDataSource.materialBillRepByProduct(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialIncomingRepByCar>>>
      materialIncomingRepByCar(MaterialIncomingRepByCarRequest request) async {
    return await repositoryHandler<List<MaterialIncomingRepByCar>>(() async {
      var response = await _remoteDataSource.materialIncomingRepByCar(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialIncomingRepByProduct>>>
      materialIncomingRepByProduct(
          MaterialIncomingRepByProductRequest request) async {
    return await repositoryHandler<List<MaterialIncomingRepByProduct>>(
        () async {
      var response =
          await _remoteDataSource.materialIncomingRepByProduct(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialIncomingRepByCustomer>>>
      materialIncomingRepByCustomer(
          MaterialIncomingRepByCustomerRequest request) async {
    return await repositoryHandler<List<MaterialIncomingRepByCustomer>>(
        () async {
      var response =
          await _remoteDataSource.materialIncomingRepByCustomer(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialIncomingRepByCustomerAndProduct>>>
      materialIncomingRepByCustomerAndProduct(
          MaterialIncomingRepByCustomerAndProductRequest request) async {
    return await repositoryHandler<
        List<MaterialIncomingRepByCustomerAndProduct>>(() async {
      var response = await _remoteDataSource
          .materialIncomingRepByCustomerAndProduct(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialMineDailyRep>>> materialMineDailyRep(
      MaterialMineDailyRepRequest request) async {
    return await repositoryHandler<List<MaterialMineDailyRep>>(() async {
      var response = await _remoteDataSource.materialMineDailyRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialMineMonthlyRep>>> materialMineMonthlyRep(
      MaterialMineMonthlyRepRequest request) async {
    return await repositoryHandler<List<MaterialMineMonthlyRep>>(() async {
      var response = await _remoteDataSource.materialMineMonthlyRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, MaterialMineTransportToSaleRatioReport>>
      materialMineTransportToSaleRatioReport(
          MaterialMineTransportToSaleRatioReportRequest request) async {
    return await repositoryHandler<MaterialMineTransportToSaleRatioReport>(
        () async {
      var response = await _remoteDataSource
          .materialMineTransportToSaleRatioReport(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<MaterialMineMostCarrierRep>>>
      materialMostCarrierRep(MaterialMostCarrierRepRequest request) async {
    return await repositoryHandler<List<MaterialMineMostCarrierRep>>(() async {
      var response = await _remoteDataSource.materialMostCarrierRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, CacheParams>> getCacheParams(
      CacheParamsRequest request) async {
    return await repositoryHandler(() async {
      var response = await _remoteDataSource.getCacheParams(request);
      if (response.message == "Ok") {
        _appPreferences.setFiscalYearDataCachedParams(jsonEncode(response.data!), request.dbName);
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<Tafsili>>> getHesabTafsiliList(
      TafsiliRequest request) async {
    return await repositoryHandler(() async {
      var response = await _remoteDataSource.getHesabTafsiliList(request);
      if (response.message == "Ok") {
        // _appPreferences.setCurrentFiscalYearDataHesabTafsili(jsonEncode(response.data!), request.dbName);
        return Right(response.data!.map((e) => e.toDomain()).toList());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, SaleDailySummaryRep>> saleDailySummaryRep(
      SaleDailySummaryRepRequest request) async {
    return await repositoryHandler<SaleDailySummaryRep>(() async {
      var response = await _remoteDataSource.saleDailySummaryRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, PlateDailySummaryRep>> plateDailySummaryRep(
      PlateDailySummaryRepRequest request) async {
    return await repositoryHandler<PlateDailySummaryRep>(() async {
      var response = await _remoteDataSource.plateDailySummaryRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, TreasuryDailySummaryRep>> treasuryDailySummaryRep(
      TreasuryDailySummaryRepRequest request) async {
    return await repositoryHandler<TreasuryDailySummaryRep>(() async {
      var response = await _remoteDataSource.treasuryDailySummaryRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, FinanceDailySummaryRep>> financeDailySummaryRep(
      FinanceDailySummaryRepRequest request) async {
    return await repositoryHandler<FinanceDailySummaryRep>(() async {
      var response = await _remoteDataSource.financeDailySummaryRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, ConcreteDailySummaryRep>> concreteDailySummaryRep(
      ConcreteDailySummaryRepRequest request) async {
    return await repositoryHandler<ConcreteDailySummaryRep>(() async {
      var response = await _remoteDataSource.concreteDailySummaryRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, BasculeDailySummaryRep>> basculeDailySummaryRep(
      BasculeDailySummaryRepRequest request) async {
    return await repositoryHandler<BasculeDailySummaryRep>(() async {
      var response = await _remoteDataSource.basculeDailySummaryRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>?>>
      treasuryDaryaftBeTafkikHesabRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request) async {
    return await repositoryHandler<List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>>(() async {
      var response = await _remoteDataSource.treasuryDaryaftBeTafkikHesabRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtRep>?>>
      treasuryDaryaftRep(TreasuryDaryaftAndPardakhtRepRequest request)async {
    return await repositoryHandler<List<TreasuryDaryaftAndPardakhtRep>>(() async {
      var response = await _remoteDataSource.treasuryDaryaftRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<TreasuryGoTajmiDaryaftAndPardakhtRep>?>>
      treasuryGoTajmiDaryaftRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request) async {
    return await repositoryHandler<List<TreasuryGoTajmiDaryaftAndPardakhtRep>>(() async {
      var response = await _remoteDataSource.treasuryGoTajmiDaryaftRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<TreasuryGoTajmiDaryaftAndPardakhtRep>?>>
      treasuryGoTajmiPardakhtRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request) async {
    return await repositoryHandler<List<TreasuryGoTajmiDaryaftAndPardakhtRep>>(() async {
      var response = await _remoteDataSource.treasuryGoTajmiPardakhtRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>?>>
      treasuryPardakhtBeTafkikHesabRep(
          TreasuryDaryaftAndPardakhtBeTafkikHesabOrTajmieiRepRequest request) async {
    return await repositoryHandler<List<TreasuryDaryaftAndPardakhtBeTafkikHesabRep>>(() async {
      var response = await _remoteDataSource.treasuryPardakhtBeTafkikHesabRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<TreasuryDaryaftAndPardakhtRep>?>>
      treasuryPardakhtRep(TreasuryDaryaftAndPardakhtRepRequest request) async {
    return await repositoryHandler<List<TreasuryDaryaftAndPardakhtRep>>(() async {
      var response = await _remoteDataSource.treasuryPardakhtRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcreteOrdersInDayRep>?>>
  concreteOrdersInDayReport(ConcreteOrdersInDayRepRequest request) async {
    return await repositoryHandler<List<ConcreteOrdersInDayRep>>(() async {
      var response = await _remoteDataSource.concreteOrdersInDayReport(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcreteSaleDetailedRep>?>>
  concreteSaleDetailedReport(ConcreteSaleDetailedRepRequest request) async {
    return await repositoryHandler<List<ConcreteSaleDetailedRep>>(() async {
      var response = await _remoteDataSource.concreteSaleDetailedReport(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcreteReportByCustomerAndProduct>?>>
  concreteReportByCustomerAndProduct(ConcreteReportByCustomerAndProductRequest request) async {
    return await repositoryHandler<List<ConcreteReportByCustomerAndProduct>>(() async {
      var response = await _remoteDataSource.concreteReportByCustomerAndProduct(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcreteSalesByProductRep>?>>
  concreteSalesByProductRep(ConcreteSalesByProductRepRequest request) async {
    return await repositoryHandler<List<ConcreteSalesByProductRep>>(() async {
      var response = await _remoteDataSource.concreteSalesByProductRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcreteSalesDailyTotaledRep>?>>
  concreteSalesDailyTotaledRep(ConcreteSalesDailyTotaledRepRequest request) async {
    return await repositoryHandler<List<ConcreteSalesDailyTotaledRep>>(() async {
      var response = await _remoteDataSource.concreteSalesDailyTotaledRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcreteMixerDailyCumulativeRep>?>>
  concreteMixerDailyCumulativeRep(ConcreteMixerDailyCumulativeRepRequest request) async {
    return await repositoryHandler<List<ConcreteMixerDailyCumulativeRep>>(() async {
      var response = await _remoteDataSource.concreteMixerDailyCumulativeRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcreteMixerDriverDetailedRep>?>>
  concreteMixerDriverDetailedRep(ConcreteMixerDriverDetailedRepRequest request) async {
    return await repositoryHandler<List<ConcreteMixerDriverDetailedRep>>(() async {
      var response = await _remoteDataSource.concreteMixerDriverDetailedRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<ConcretePompKarkardPompRep>?>>
  concretePompKarkardPompRep(ConcretePompKarkardPompRepRequest request) async {
    return await repositoryHandler<List<ConcretePompKarkardPompRep>>(() async {
      var response = await _remoteDataSource.concretePompKarkardPompRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, FinancialBedBesRep?>>
  financialBedBesReport(FinancialBedBesRepRequest request) async {
    return await repositoryHandler<FinancialBedBesRep?>(() async {
      var response = await _remoteDataSource.financialBedBesReport(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<FinancialGozareshHesabRep>?>>
  financialGozareshHesabReport(FinancialGozareshHesabRepRequest request) async {
    return await repositoryHandler<List<FinancialGozareshHesabRep>>(() async {
      var response = await _remoteDataSource.financialGozareshHesabReport(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, String?>>
  managementLockHesab(ManagementLockHesabRequest request) async {
    return await repositoryHandler<String?>(() async {
      var response = await _remoteDataSource.managementLockHesab(request);
      if (response.message == "Ok") {
        return Right(response.data);
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, String>> managementSetHesabLockConditions(
      ManagementSetHesabLockConditionsRequest request) async {
    return await repositoryHandler<String>(() async {
      var response = await _remoteDataSource.managementSetHesabLockConditions(request);
      if (response.message == "Ok") {
        return Right(response.data.orEmpty());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, GetHesabLockConditions>> managementGetHesabLockConditions(
      String request) async {
    return await repositoryHandler<GetHesabLockConditions>(() async {
      var response = await _remoteDataSource.managementGetHesabLockConditions(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<PlateReaderDailyTotaledAndTotaledRep>?>> plateReaderDailyTotaledRep(
      PlateReaderDetailedAndDailyTotaledRepRequest request) async {
    return await repositoryHandler<List<PlateReaderDailyTotaledAndTotaledRep>>(() async {
      var response = await _remoteDataSource.plateReaderDailyTotaledRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<PlateReaderDailyTotaledAndTotaledRep>?>> plateReaderTotaledRep(
      PlateReaderDetailedAndDailyTotaledRepRequest request) async {
    return await repositoryHandler<List<PlateReaderDailyTotaledAndTotaledRep>>(() async {
      var response = await _remoteDataSource.plateReaderTotaledRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<PlateReaderDetailedRep>?>> plateReaderDetailedRep(
      PlateReaderDetailedAndDailyTotaledRepRequest request) async {
    return await repositoryHandler<List<PlateReaderDetailedRep>>(() async {
      var response = await _remoteDataSource.plateReaderDetailedRep(request);
      if (response.message == "Ok") {
        return Right(response.data!.toDomain());
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, List<PlateReaderInstanceList>?>> plateReaderGetInstanceList() async {
    return await repositoryHandler<List<PlateReaderInstanceList>>(() async {
      var response = await _remoteDataSource.plateReaderGetInstanceList();
      if (response.message == "Ok") {
        final res = response.data!.toDomain();
        _appPreferences.setCompanyPlateReaderInstanceList(jsonEncode(res));
        return Right(res);
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }

  @override
  Future<Either<Failure, String?>> concreteAddOrder(
      ConcreteAddOrderRequest request) async {
    return await repositoryHandler<String?>(() async {
      var response = await _remoteDataSource.concreteAddOrder(request);
      if (response.message == "Ok") {
        return Right(response.data);
      }
      return Left(Failure(ApiInternalStatus.FAILURE, response.message ?? ""));
    });
  }
}
