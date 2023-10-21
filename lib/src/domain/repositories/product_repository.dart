import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:maxway/src/data/models/product/product_detail_response.dart';

import '../../data/models/product/product_modifier_response.dart';
import '../network/api_client.dart';
import '../network/failure.dart';
import '../network/server_error.dart';


class ProductRepository{
  const ProductRepository({required this.apiClient});

  final ApiClient apiClient;

  Future<Either<ServerFailure, ProductDetail>> getProductDetail({required String productId}) async{
    try {
      final response = await apiClient.getProductDetail(productId);
      return Right(response);
    } on DioException catch (error) {
      final exception = ServerError.withDioError(error: error);
      return Left(exception.failure);
    } on Exception catch (_) {
      return Left(ServerFailure(message: "Something wrong"));
    }
  }

  Future<Either<ServerFailure, ProductModifierResponse>> getProductModifier({required String? productId}) async {
    try {
      final response = await apiClient.getProductModifier(productId);
      return Right(response);
    } on DioException catch (error) {
      final exception = ServerError.withDioError(error: error);
      return Left(exception.failure);
    } on Exception catch (_) {
      return Left(ServerFailure(message: "Something wrong"));
    }
  }
}