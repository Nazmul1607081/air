import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

String AppID = "ca-app-pub-8498094515921487~8507782151";
String AdID = "ca-app-pub-8498094515921487/8565630084";

class AdMob extends StatefulWidget {
  @override
  _AdMobState createState() => _AdMobState();
}

class _AdMobState extends State<AdMob> {
  BannerAd myBanner;

  /*BannerAd buildBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner..show();
          }
        });
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.largeBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.top,
                  anchorOffset: MediaQuery.of(context).size.height * 0.15);
          }
        });
  }*/

  @override
  void initState() {
    super.initState();
    //FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    // myBanner = buildBannerAd()..load();
    Admob.initialize(FirebaseAdMob.testAppId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AdmobBanner(
            adSize: AdmobBannerSize.FULL_BANNER,
            adUnitId: BannerAd.testAdUnitId,
          );
        }
        return AdmobBanner(
          adSize: AdmobBannerSize.FULL_BANNER,
          adUnitId: BannerAd.testAdUnitId,
        );
      },
    );
  }
}
