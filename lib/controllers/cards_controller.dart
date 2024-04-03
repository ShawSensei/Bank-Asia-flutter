import 'dart:convert';

import 'package:bank_asia_flutter/requestModels/card_info_req_model.dart';
import 'package:bank_asia_flutter/requestModels/statement_req_model.dart';
import 'package:bank_asia_flutter/responseModels/card_info_res_model.dart';
import 'package:bank_asia_flutter/responseModels/statement_res_model.dart';
import 'package:bank_asia_flutter/utils/rsa_encryption.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../components/card_list.dart';
import '../models/card_model.dart';
import '../requestModels/last_10_transaction_req_model.dart';
import '../responseModels/credit_card_list_res_model.dart';
import '../responseModels/last_10_transaction_res_model.dart';
import '../utils/api_helper.dart';
import '../utils/api_urls.dart';
import 'package:http/http.dart' as http;

class CardsController extends GetxController {
  final cardListUrl = Uri.parse(ApiUrls.cardListUrl);

  //final cardInfoListUrl = Uri.parse(ApiUrls.cardInfoListUrl);
  final cardInfoUrl = Uri.parse(ApiUrls.cardInfoUrl);
  final last10TransactionUrl = Uri.parse(ApiUrls.last10Transaction);
  final statementUrl = Uri.parse(ApiUrls.statementUrl);

  final rsaEncryption = RSAEncryption();

  var buttonCarouselController = CarouselController().obs;
  var currentIndex = 0.obs;
  var isLoading = true.obs;

  var cards = <CreditCardListResModel>[].obs;
  var cardInfo = CardInfoResModel().obs;
  var last10Transaction = Last10TransactionResModel().obs;
  var statement = StatementResModel().obs;

  //var cardInfo = CardInfoResModel().obs;

  // void fetchCardInfo() async {
  //   try {
  //     List<CardInfoModel> fetchedCards = await CardList.fetchCards();
  //     cards.value = fetchedCards;
  //     isLoading.value = false;
  //   } catch (e) {
  //     print('Failed to fetch card info: $e');
  //     // Handle error here
  //   }
  // }

  Future<void> getCreditCardInfo() async {
    try {
      // final reqBody = CardInfoReqModel(
      //   fullPan: rsaEncryption.getEncryptedData("2345234523452345"),
      //   expireDate: rsaEncryption.getEncryptedData("23/10/2023"),
      // ).toMap();
      //
      // debugPrint('reqBody: $reqBody');

      // final response = await ApiHelper.makeFormUrlEncodedPostRequest(
      //   apiUrl: cardListUrl,
      //   reqBody: reqBody,
      // );

      final response = await http.get(
        Uri.parse(ApiUrls.cardListUrl),
      );

      debugPrint('last 10 response: ${response.body}');

      isLoading.value = false;

      List<dynamic> decodedBody = jsonDecode(response.body);
      final resData = CreditCardListResModel.fromJsonList(decodedBody);

      if (resData.isNotEmpty) {
        cards.value = resData;
        debugPrint("last 10 response: $resData");
      } else {
        debugPrint("${resData.length}");
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> getCardInfo(String fullPan) async {
    try {
      // final reqBody = CardInfoReqModel(
      //   fullPan: rsaEncryption.getEncryptedData(fullPan),
      //   expireDate: rsaEncryption.getEncryptedData("23/10/2023"),
      // ).toMap();

      final reqBody = CardInfoReqModel(
        fullPan: fullPan,
        expireDate: "23/10/2023",
      ).toMap();

      debugPrint('info reqBody: $reqBody');

      final response = await ApiHelper.makeFormUrlEncodedPostRequest(
        apiUrl: cardInfoUrl,
        reqBody: reqBody,
      );

      // final response = await http.get(
      //   Uri.parse(ApiUrls.cardInfoListUrl),
      // );

      debugPrint('info response: ${response.body}');

      isLoading.value = false;

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      final resData = CardInfoResModel.fromJsonObject(decodedBody);

      if (resData.resCode == '0') {
        cardInfo.value = resData;
        debugPrint("$resData");
      } else {
        debugPrint("${resData.resMessage}");
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> getLast10Transaction(String fullPan) async {
    try {
      // final reqBody = CardInfoReqModel(
      //   fullPan: rsaEncryption.getEncryptedData(fullPan),
      //   expireDate: rsaEncryption.getEncryptedData("23/10/2023"),
      // ).toMap();

      final reqBody = Last10TransactionReqModel(
        fullPan: fullPan,
        expireDate: "23/10/2023",
      ).toMap();

      debugPrint('info reqBody: $reqBody');

      final response = await ApiHelper.makeFormUrlEncodedPostRequest(
        apiUrl: last10TransactionUrl,
        reqBody: reqBody,
      );

      // final response = await http.get(
      //   Uri.parse(ApiUrls.cardInfoListUrl),
      // );

      debugPrint('info response: ${response.body}');

      isLoading.value = false;

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      final resData = Last10TransactionResModel.fromJsonObject(decodedBody);

      if (resData.responseCode == '0') {
        last10Transaction.value = resData;
        debugPrint("$resData");
      } else {
        debugPrint("${resData.responseMessage}");
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> getStatement(String fullPan) async {
    try {
      // final reqBody = CardInfoReqModel(
      //   fullPan: rsaEncryption.getEncryptedData(fullPan),
      //   expireDate: rsaEncryption.getEncryptedData("23/10/2023"),
      // ).toMap();

      final reqBody = StatementReqModel(
        fullPan: fullPan,
        count: "4",
      ).toMap();

      debugPrint('info reqBody: $reqBody');

      final response = await ApiHelper.makeFormUrlEncodedPostRequest(
        apiUrl: statementUrl,
        reqBody: reqBody,
      );

      // final response = await http.get(
      //   Uri.parse(ApiUrls.cardInfoListUrl),
      // );

      debugPrint('statement response: ${response.body}');

      isLoading.value = false;

      Map<String, dynamic> decodedBody = jsonDecode(response.body);
      final resData = StatementResModel.fromJsonObject(decodedBody);

      if (resData.responseCode == '0') {
        statement.value = resData;
        debugPrint("Statement: $resData");
      } else {
        debugPrint("${resData.resMesLStatement}");
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
