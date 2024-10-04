/// AppImages represents the images used in this app.
sealed class AppImages {
  // Constant references for all the bundled Undraw SVG image assets.
  static const String appInstallation = 'assets/images/ud_app_installation.svg';
  static const String apps = 'assets/images/ud_apps.svg';
  static const String cityWalk = 'assets/images/ud_city_walk.svg';
  static const String darkMode = 'assets/images/ud_dark_mode.svg';
  static const String dreamWorld = 'assets/images/ud_dream_world.svg';
  static const String blocks = 'assets/images/ud_building_blocks.svg';
  static const String empty = 'assets/images/ud_empty.svg';
  static const String energizer = 'assets/images/ud_energizer.svg';
  static const String environment = 'assets/images/ud_environment.svg';
  static const String farmGirl = 'assets/images/ud_farm_girl.svg';
  static const String fileSync = 'assets/images/ud_file_sync.svg';
  static const String healthyOptions = 'assets/images/ud_healthy_options.svg';
  static const String homeScreen = 'assets/images/ud_home_screen.svg';
  static const String inSync = 'assets/images/ud_in_sync.svg';
  static const String mobileApps = 'assets/images/ud_mobile_apps.svg';
  static const String mobileDevices = 'assets/images/ud_mobile_devices.svg';
  static const String mobileFeed = 'assets/images/ud_mobile_feed.svg';
  static const String mobileSell = 'assets/images/ud_mobile_sell.svg';
  static const String mobileWeb = 'assets/images/ud_mobile_web.svg';
  static const String modernDesign = 'assets/images/ud_modern_design.svg';
  static const String myNotifications = 'assets/images/ud_my_notifications.svg';
  static const String nature = 'assets/images/ud_nature.svg';
  static const String natureOnScreen = 'assets/images/ud_nature_on_screen.svg';
  static const String openedTabs = 'assets/images/ud_opened_tabs.svg';
  static const String openSource = 'assets/images/ud_open_source.svg';
  static const String permissionDenied =
      'assets/images/ud_permission_denied.svg';
  static const String postOnline = 'assets/images/ud_post_online.svg';
  static const String postingPhoto = 'assets/images/ud_posting_photo.svg';
  static const String prioritize = 'assets/images/ud_prioritise.svg';
  static const String productTeardown = 'assets/images/ud_product_teardown.svg';
  static const String progressOverview =
      'assets/images/ud_progress_overview.svg';
  static const String progressApp = 'assets/images/ud_progressive_app.svg';
  static const String setPreferences = 'assets/images/ud_set_preferences.svg';
  static const String setupWizard = 'assets/images/ud_setup_wizard.svg';
  static const String sharingArticles = 'assets/images/ud_sharing_articles.svg';
  static const String suburbs = 'assets/images/ud_suburbs.svg';
  static const String webDevices = 'assets/images/ud_web_devices.svg';
  static const String takeoutBoxes = 'assets/images/ud_takeout_boxes.svg';
  static const String verified = 'assets/images/ud_verified.svg';
  static const String walkingAround = 'assets/images/ud_walking_around.svg';
  static const String walkingOutside = 'assets/images/ud_walking_outside.svg';

  // The main 3 images for demo shop, bundling them, don't want them to break.
  static const String shopMen = 'assets/images/shop_man_look_right.jpg';
  static const String shopWomen = 'assets/images/shop_woman_look_left.jpg';
  static const String shopPets = 'assets/images/shop_pet.jpg';

  // There are 16 images above, only 9 actually used in this setup.
  static const List<String> undraw = <String>[
    healthyOptions,
    openedTabs,
    setupWizard,
    openSource,
    setPreferences,
  ];

  // All the above Undraw SVG asset strings in a list
  static const List<String> allImages = <String>[
    appInstallation,
    apps,
    cityWalk,
    darkMode,
    dreamWorld,
    blocks,
    empty,
    energizer,
    environment,
    farmGirl,
    fileSync,
    healthyOptions,
    homeScreen,
    inSync,
    mobileApps,
    mobileDevices,
    mobileFeed,
    mobileSell,
    mobileWeb,
    modernDesign,
    myNotifications,
    nature,
    natureOnScreen,
    openedTabs,
    openSource,
    permissionDenied,
    postOnline,
    postingPhoto,
    prioritize,
    productTeardown,
    progressOverview,
    progressApp,
    setPreferences,
    setupWizard,
    sharingArticles,
    suburbs,
    webDevices,
    takeoutBoxes,
    verified,
    walkingAround,
    walkingOutside,
  ];
}
