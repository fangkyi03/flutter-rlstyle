import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rlstyles/main.dart';

enum IndexRequest { tabbar }

Future<Response> getTabbar() {
  return Dio().get(
      'https://mapi.m.jd.com/bottomNav/getBottomNavigation.action?_format_=json&isNewVersion=1&curtainVersion=null&t=0.4529003436868648',
      options: Options(headers: {'content-type': 'application/json'}));
}

Map<IndexRequest, dynamic> useRequest() {
  final tabbar = useState([]);
  useEffect(() {
    getTabbar().then((value) => tabbar.value = jsonDecode(value.data)['icons']);
    return;
  }, []);
  return {IndexRequest.tabbar: tabbar};
}
