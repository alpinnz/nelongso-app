import 'package:nelongso_app/features/bisdev/provider/investor.provider.dart';
import 'package:nelongso_app/features/bisdev/provider/outlet.provider.dart';

class BisdevRepository {
  final _investorProvider = InvestorProvider();
  final _outletProvider = OutletProvider();

  Future<dynamic> fetchInvestoryList({String year}) async {
    dynamic data = await _investorProvider.fetchList(year: year);
    return data;
  }

  Future<dynamic> fetchOutletList({String year}) async {
    dynamic data = await _outletProvider.fetchList(year: year);
    return data;
  }
}

class NetworkError extends Error {}
