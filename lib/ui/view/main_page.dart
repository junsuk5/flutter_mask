import 'package:flutter/material.dart';
import 'package:mask/ui/widget/remain_stat_list_tile.dart';
import 'package:mask/viewmodel/store_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳 : ${storeModel.stores.length}곳'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              storeModel.fetch();
            },
          )
        ],
      ),
      body: _buildBody(storeModel),
    );
  }

  Widget _buildBody(StoreModel storeModel) {
    if (storeModel.isLoading == true) {
      return loadingWidget();
    }

    if (storeModel.stores.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('반경 5km 이내에 재고가 있는 매장이 없습니다'),
            Text('또는 인터넷이 연결되어 있는지 확인해 주세요'),
          ],
        ),
      );
    }

    return ListView(
      children: storeModel.stores.map((e) {
        return RemainStatListTile(e);
      }).toList(),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('정보를 가져오는 중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
