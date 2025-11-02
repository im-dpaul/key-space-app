import 'dart:async';

import 'package:logger/logger.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:key_space_app/widgets/toast/toast_utils.dart';
import 'package:key_space_app/utils/debounce_handler/debounce.dart';
import 'package:key_space_app/services/internet_connectivity/internet_connectivity.dart';

class InternetConnectivityContract implements InternetConnectivity {
  bool _isConnected = false;
  final _log = Logger();
  final Connectivity _connectivity = Connectivity();
  //late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  bool get isConnected => _isConnected;

  InternetConnectivityContract() {
    //_connectivitySubscription =
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  Future<void> init() async {
    late List<ConnectivityResult> results;
    try {
      results = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      _log.d('Couldn\'t check connectivity status $e');
      // router.goNamed(RoutersName.noInternet);
      return;
    }
    return _updateConnectionStatus(results);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    EasyDebounce.debounce('core', const Duration(milliseconds: 1000), () async {
      final ConnectivityResult result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;

      _log.i(result);

      if (result != ConnectivityResult.none) {
        _isConnected = await InternetConnection().hasInternetAccess;
        _log.i(isConnected);
        if (!_isConnected) {
          ToastUtils.showToast("No or low internet connectivity!!");
        }
      }
    });
  }
}
