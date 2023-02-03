// TODO(rydmike): Clean out unused images.

/// AppImages represents the images used in this app.
class AppImages {
  AppImages._();

  // Constant references for all the bundled Undraw SVG image assets.
  static const String choosingHouse = 'assets/images/choosing_house.svg';
  static const String cityWalk = 'assets/images/city_walk.svg';
  static const String dreamWorld = 'assets/images/dream_world.svg';
  static const String empty = 'assets/images/empty.svg';
  static const String energizer = 'assets/images/energizer.svg';
  static const String environment = 'assets/images/environment.svg';
  static const String farmGirl = 'assets/images/farm_girl.svg';
  static const String giftBox = 'assets/images/gift_box.svg';
  static const String mobileSell = 'assets/images/mobile_sell.svg';
  static const String nature = 'assets/images/nature.svg';
  static const String natureOnScreen = 'assets/images/nature_on_screen.svg';
  static const String permissionDenied = 'assets/images/permission_denied.svg';
  static const String suburbs = 'assets/images/suburbs.svg';
  static const String sharingArticles = 'assets/images/sharing_articles.svg';
  static const String takeoutBoxes = 'assets/images/takeout_boxes.svg';

  // TODO(rydmike): Only used one so far.
  static const String verified = 'assets/images/verified.svg';
  static const String walkingAround = 'assets/images/walking_around.svg';
  static const String walkingOutside = 'assets/images/walking_outside.svg';

  // There are 16 images above, only 9 actually used in this setup.
  // The extra images are topic related images that can be tried instead.
  // The 16 images are 178 kB in total, the currently used 9 are 97.4kB.
  // More alternative images can be found at: https://undraw.co/illustrations
  // TODO(rydmike): Remove not used images when selections have been finalized.
  static const List<String> introSellBuy = <String>[
    mobileSell,
    sharingArticles,
    verified,
  ];
  static const List<String> introAroundYou = <String>[
    suburbs,
    walkingAround,
    takeoutBoxes,
  ];
  static const List<String> introSavePlanet = <String>[
    natureOnScreen,
    farmGirl,
    environment,
  ];
}
