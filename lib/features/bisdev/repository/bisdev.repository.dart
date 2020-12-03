import 'package:nelongso_app/features/bisdev/provider/investor.provider.dart';
import 'package:nelongso_app/features/bisdev/provider/outlet.provider.dart';

class BisdevRepository {
  final _investorProvider = InvestorProvider();
  final _outletProvider = OutletProvider();

  Future<dynamic> fetchInvestoryList() async {
    dynamic data = await _investorProvider.fetchList();
    return data;
  }

  Future<dynamic> fetchOutletList() async {
    dynamic data = await _outletProvider.fetchList();
    return data;
  }
}

class NetworkError extends Error {}
