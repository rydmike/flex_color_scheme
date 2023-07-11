import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/const/app.dart';
import '../../../../shared/const/app_images.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
import '../../../../shared/utils/link_text_span.dart';

// An example shop that show what an app using the theme might look like.
//
// This UI is a slight modification and modernization of Flutter UI e-Commerce
// application https://flutterui.design/components/ecommerce. The original
// version made by Zachery Gentry, zach@flutterui.design @zacherygentry.
// Thanks, rights and credits belong to Zachery for letting me use the shop
// example application in the Themes Playground.

Cart cart = Cart();

class AppExampleShop extends StatefulWidget {
  const AppExampleShop({super.key});

  @override
  State<AppExampleShop> createState() => _AppExampleShopState();
}

class _AppExampleShopState extends State<AppExampleShop> {
  late String searchString;
  @override
  void initState() {
    searchString = '';
    super.initState();
  }

  void setSearchString(String value) => setState(() {
        searchString = value;
      });

  @override
  Widget build(BuildContext context) {
    final EdgeInsets safeArea = MediaQuery.viewPaddingOf(context);
    final EdgeInsetsDirectional listViewPadding = EdgeInsetsDirectional.only(
      start: 16,
      end: 16,
      top: 16 + safeArea.top + kToolbarHeight,
      bottom: 16,
    );
    List<Widget> searchResultTiles = <Widget>[];
    if (searchString.isNotEmpty) {
      searchResultTiles = products
          .where((Product p) =>
              p.name.toLowerCase().contains(searchString.toLowerCase()))
          .map(
            (Product p) => ProductTile(product: p),
          )
          .toList();
    }
    final ThemeData theme = Theme.of(context);
    return ScrollConfiguration(
      behavior: const DragScrollBehavior(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: SearchBar(onChanged: setSearchString),
          actions: const <Widget>[
            CartAppBarAction(),
            ShopAbout(useRootNavigator: false),
          ],
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: searchString.isNotEmpty
              ? GridView.count(
                  padding: listViewPadding,
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: .75,
                  children: searchResultTiles,
                )
              : ListView(
                  padding: listViewPadding,
                  children: <Widget>[
                    Text(
                      'Shop by Category',
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 16),
                    CategoryTile(
                      imageUrl: AppImages.shopMen,
                      category: _mensCategory,
                      imageAlignment: Alignment.topCenter,
                    ),
                    const SizedBox(height: 16),
                    CategoryTile(
                      imageUrl: AppImages.shopWomen,
                      category: _womensCategory,
                      imageAlignment: Alignment.topCenter,
                    ),
                    const SizedBox(height: 16),
                    CategoryTile(
                      imageUrl: AppImages.shopPets,
                      category: _petsCategory,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class CartAppBarAction extends StatefulWidget {
  const CartAppBarAction({super.key});

  @override
  State<CartAppBarAction> createState() => _CartAppBarActionState();
}

class _CartAppBarActionState extends State<CartAppBarAction> {
  @override
  void initState() {
    cart.addListener(blankSetState);
    super.initState();
  }

  @override
  void dispose() {
    cart.removeListener(blankSetState);
    super.dispose();
  }

  void blankSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8.0),
      child: IconButton(
        icon: Badge.count(
          count: cart.itemsInCart.length,
          isLabelVisible: cart.itemsInCart.isNotEmpty,
          child: const Icon(
            Icons.shopping_cart,
          ),
        ),
        onPressed: () => _pushScreen(
          context: context,
          screen: const CartScreen(),
        ),
      ),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, super.key});
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;

  @override
  void initState() {
    selectedImageUrl = product.imageUrls.first;
    selectedSize = product.sizes?.first;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color background = isLight
        ? theme.colorScheme.surfaceVariant
        : theme.colorScheme.onSurface;
    final Color iconColor = isLight
        ? theme.colorScheme.secondary.withOpacity(0.8)
        : theme.colorScheme.secondaryContainer.withOpacity(0.8);
    final List<Widget> imagePreviews = product.imageUrls
        .map(
          (String url) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => setSelectedImageUrl(url),
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: selectedImageUrl == url
                      ? Border.all(color: theme.colorScheme.tertiary, width: 2)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  url,
                  loadingBuilder: (_, Widget child,
                          ImageChunkEvent? loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const Center(child: CircularProgressIndicator()),
                  errorBuilder: (_, Object child, StackTrace? trace) => Icon(
                    Icons.image_not_supported_outlined,
                    size: 30,
                    color: iconColor,
                  ),
                  cacheHeight: 100,
                ),
              ),
            ),
          ),
        )
        .toList();

    final List<Widget> sizeSelectionWidgets = product.sizes
            ?.map(
              (String s) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setSelectedSize(s);
                  },
                  child: Container(
                    height: 42,
                    width: 38,
                    decoration: BoxDecoration(
                      color: selectedSize == s
                          ? theme.colorScheme.tertiaryContainer
                          : null,
                      border: Border.all(
                        color: theme.colorScheme.outline,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        s,
                        style: theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: selectedSize == s
                                ? theme.colorScheme.onTertiaryContainer
                                : null),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList() ??
        <Widget>[];

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product.productType),
          actions: const <Widget>[CartAppBarAction()]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.sizeOf(context).height * .35,
              color: background,
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                      selectedImageUrl!,
                      loadingBuilder:
                          (_, Widget child, ImageChunkEvent? loadingProgress) =>
                              loadingProgress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator()),
                      errorBuilder: (_, Object child, StackTrace? trace) =>
                          Icon(
                        Icons.image_not_supported_outlined,
                        size: 200,
                        color: iconColor,
                      ),
                      cacheHeight: 500,
                      fit: BoxFit.cover,
                      color: background,
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagePreviews,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$${product.cost}',
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: theme.colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      product.description ??
                          'Lorem ipsum dolor sit amet, consectetur adipiscing '
                              'elit. Integer quis purus laoreet, efficitur '
                              'libero ferto vel, feugiat ante. Vestibulum '
                              'tempor, ligula.',
                      style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    if (sizeSelectionWidgets.isNotEmpty) ...<Widget>[
                      Text(
                        'Size',
                        style: theme.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: sizeSelectionWidgets,
                      ),
                    ],
                    const Spacer(),
                    Center(
                      child: CallToActionButton(
                        onPressed: () => cart.add(
                          OrderItem(
                            product: product,
                            selectedSize: selectedSize,
                          ),
                        ),
                        labelText: 'Add to Cart',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  const CallToActionButton(
      {required this.onPressed,
      required this.labelText,
      this.minSize = const Size(266, 45),
      super.key});
  final Function onPressed;
  final String labelText;
  final Size minSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        minimumSize: minSize,
      ),
      child: Text(labelText, style: const TextStyle(fontSize: 16)),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, super.key});
  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

enum Filters { popular, recent, sale }

class _CategoryScreenState extends State<CategoryScreen> {
  Category get category => widget.category;
  Filters filterValue = Filters.popular;
  String? selection;
  late List<Product> categoryProducts;

  @override
  void initState() {
    selection = category.selections.first;
    categoryProducts =
        products.where((Product p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets safeArea = MediaQuery.viewPaddingOf(context);
    final EdgeInsetsDirectional listViewPadding = EdgeInsetsDirectional.only(
      start: 0,
      end: 0,
      top: 16 + safeArea.top + kToolbarHeight,
      bottom: 16,
    );
    final List<ProductRow> productRows = category.selections
        .map((String s) => ProductRow(
              productType: s,
              products: categoryProducts
                  .where((Product p) =>
                      p.productType.toLowerCase() == s.toLowerCase())
                  .toList(),
            ))
        .toList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
        actions: const <Widget>[
          CartAppBarAction(),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ScrollConfiguration(
          behavior: const DragScrollBehavior(),
          child: ListView.separated(
            padding: listViewPadding,
            itemCount: productRows.length,
            itemBuilder: (_, int index) => productRows[index],
            separatorBuilder: (_, int index) => const SizedBox(height: 16),
          ),
        ),
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  const ProductRow(
      {required this.products, required this.productType, super.key});
  final String productType;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    List<ProductTile> productTiles;
    productTiles =
        products.map((Product p) => ProductTile(product: p)).toList();

    return productTiles.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  productType,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 222,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: productTiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) => productTiles[index],
                  separatorBuilder: (_, int index) => const SizedBox(width: 8),
                ),
              ),
            ],
          );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return OpenContainer(
      tappable: false,
      closedElevation: 0,
      openElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedShape: const RoundedRectangleBorder(),
      closedBuilder: (BuildContext context, void Function() openContainer) {
        return GestureDetector(
          onTap: () {
            unawaited(SystemSound.play(SystemSoundType.click));
            openContainer();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: theme.useMaterial3 ? 0.4 : 1.5,
              margin: EdgeInsets.zero,
              color: theme.colorScheme.surface,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shadowColor: theme.colorScheme.primary,
              child: SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ProductImage(product: product),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Text(
                          '\$${product.cost}',
                          style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.tertiary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      openBuilder: (BuildContext context, void Function() action) =>
          ProductScreen(product: product),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color background = isLight
        ? theme.colorScheme.surfaceVariant
        : theme.colorScheme.onSurface;
    final Color iconColor = isLight
        ? theme.colorScheme.secondary.withOpacity(0.8)
        : theme.colorScheme.secondaryContainer.withOpacity(0.8);
    return AspectRatio(
      aspectRatio: .95,
      child: ColoredBox(
        color: background,
        child: Image.network(
          product.imageUrls.first,
          loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) =>
              loadingProgress == null
                  ? child
                  : const Center(child: CircularProgressIndicator()),
          errorBuilder: (_, Object child, StackTrace? trace) => Icon(
            Icons.image_not_supported_outlined,
            size: 80,
            color: iconColor,
          ),
          cacheHeight: 500,
          color: background,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    cart.addListener(updateState);
  }

  @override
  void dispose() {
    cart.removeListener(updateState);
    super.dispose();
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<Widget> orderItemRows = cart.itemsInCart
        .map(
          (OrderItem item) => Row(
            children: <Widget>[
              Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: SizedBox(
                  width: 125,
                  child: ProductImage(
                    product: item.product,
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.product.name,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${item.product.cost}',
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => cart.remove(item),
                color: theme.colorScheme.error,
              )
            ],
          ),
        )
        .toList();
    final EdgeInsets safeArea = MediaQuery.viewPaddingOf(context);
    final EdgeInsetsDirectional listViewPadding = EdgeInsetsDirectional.only(
      start: 16,
      end: 16,
      top: 16 + safeArea.top + kToolbarHeight,
      bottom: 16,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: <Widget>[
            const Text('Cart'),
            Text('${cart.itemsInCart.length} items',
                style: const TextStyle(fontSize: 12))
          ],
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        left: false,
        right: false,
        child: Column(
          children: <Widget>[
            if (orderItemRows.isNotEmpty)
              Expanded(
                child: ScrollConfiguration(
                  behavior: const DragScrollBehavior(),
                  child: SafeArea(
                    top: false,
                    bottom: false,
                    left: true,
                    right: true,
                    child: ListView.separated(
                      padding: listViewPadding,
                      itemCount: orderItemRows.length,
                      itemBuilder: (_, int index) => orderItemRows[index],
                      separatorBuilder: (_, int index) => const SizedBox(
                        height: 16,
                      ),
                    ),
                  ),
                ),
              )
            else
              const Expanded(child: Center(child: Text('Your cart is empty'))),
            Material(
              elevation: 8,
              color: theme.colorScheme.surface,
              surfaceTintColor: theme.colorScheme.surfaceTint,
              child: SafeArea(
                top: false,
                bottom: false,
                left: true,
                right: true,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Total',
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            '\$${cart.totalCost.toStringAsFixed(2)}',
                            style: theme.textTheme.titleSmall,
                          ),
                        ],
                      ),
                      CallToActionButton(
                        onPressed: () {},
                        labelText: 'Check Out',
                        minSize: const Size(220, 45),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {required this.category,
      required this.imageUrl,
      this.imageAlignment = Alignment.center,
      super.key});
  final String imageUrl;
  final Category category;
  final Alignment imageAlignment; // Which part of the image to prefer

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: InkWell(
        onTap: () => _pushScreen(
          context: context,
          screen: CategoryScreen(
            category: category,
          ),
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                image: AssetImage(imageUrl),
                alignment: imageAlignment,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  category.title.toUpperCase(),
                  style: theme.textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: _textEditingController,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search...',
        suffixIcon: IconButton(
          constraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          splashRadius: 24,
          icon: const Icon(Icons.clear),
          onPressed: () {
            _textEditingController.clear();
            widget.onChanged(_textEditingController.text);
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final List<String> selections;

  Category({required this.title, required this.selections});
}

void _pushScreen({required BuildContext context, required Widget screen}) {
  unawaited(Navigator.push(
    context,
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => screen),
  ));
}

class Product {
  final String name;
  final List<String> imageUrls;
  final double cost;
  final String? description;
  final List<String>? sizes;

  /// Which overall category this product belongs in. Men, Women, Pets, etc.
  final Category category;

  /// Represents type of product such as shirt, jeans, pet treats, etc.
  final String productType;

  Product(
      {required this.name,
      required this.imageUrls,
      required this.cost,
      this.description,
      this.sizes,
      required this.category,
      required this.productType});
}

class Cart extends ChangeNotifier {
  List<OrderItem> itemsInCart = <OrderItem>[];

  double get totalCost {
    double total = 0;
    for (final OrderItem item in itemsInCart) {
      total += item.product.cost;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    itemsInCart.remove(orderItem);
    notifyListeners();
  }
}

/// An about icon button used on the example's app app bar.
class ShopAbout extends StatelessWidget {
  const ShopAbout({super.key, this.color, this.useRootNavigator = true});

  /// The color used on the icon button.
  ///
  /// If null, default to Icon() class default color.
  final Color? color;

  /// Use root navigator?
  final bool useRootNavigator;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info, color: color),
      onPressed: () {
        showAppAboutDialog(context, useRootNavigator);
      },
    );
  }
}

/// This [showAppAboutDialog] function is based on the [AboutDialog] example
/// that exist(ed) in the Flutter Gallery App.
void showAppAboutDialog(BuildContext context, [bool useRootNavigator = true]) {
  final ThemeData theme = Theme.of(context);
  final TextStyle aboutTextStyle = theme.textTheme.bodyLarge!;
  final TextStyle footerStyle = theme.textTheme.bodySmall!;
  final TextStyle linkStyle =
      theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.primary);

  final Size mediaSize = MediaQuery.sizeOf(context);
  final double width = mediaSize.width;
  final double height = mediaSize.height;

  final Uri sourceLink = Uri(
    scheme: 'https',
    host: 'flutterui.design',
    path: 'components/ecommerce',
  );

  showAboutDialog(
    context: context,
    applicationName: 'Shop',
    applicationVersion: '1.0',
    useRootNavigator: useRootNavigator,
    applicationIcon: Icon(
      Icons.star,
      size: 50,
      color: theme.colorScheme.primary,
    ),
    applicationLegalese: '© Zachery Gentry',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                style: aboutTextStyle,
                text: 'This app is included to show the used theme on '
                    'a compact shop app. It is a minor modification '
                    'of the open source shop app available at ',
              ),
              LinkTextSpan(
                style: linkStyle,
                uri: sourceLink,
                text: 'flutterui.design',
              ),
              TextSpan(
                style: aboutTextStyle,
                text: '. Included here with permission. Credits and '
                    'thanks to its author Zachery Gentry.\n\n',
              ),
              TextSpan(
                style: footerStyle,
                text: 'Built with Flutter ${App.flutterVersion}, '
                    'using ${App.packageName} '
                    '${App.packageVersion}\n'
                    'Media size (w:${width.toStringAsFixed(0)}, '
                    'h:${height.toStringAsFixed(0)})\n\n',
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class OrderItem {
  OrderItem({required this.product, this.selectedSize, this.selectedColor});

  Product product;
  String? selectedSize;
  String? selectedColor;
}

Category _mensCategory = Category(title: 'Men', selections: <String>[
  'Shirts',
  'Jeans',
  'Shorts',
  'Jackets',
]);
Category _womensCategory = Category(title: 'Women', selections: <String>[
  'Shirts',
  'Jeans',
]);
Category _petsCategory = Category(title: 'Pets', selections: <String>[
  'Toys',
  'Treats',
]);

List<Product> products = <Product>[
  Product(
      name: 'Crewneck T-Shirts',
      imageUrls: <String>[
        'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL.jpg',
        'https://m.media-amazon.com/images/I/716CJVk6FLS.jpg',
        'https://m.media-amazon.com/images/I/81AVnzFKUqS.jpg',
      ],
      cost: 12.99,
      category: _mensCategory,
      productType: 'Shirts',
      sizes: <String>['S', 'M', 'L', 'XL']),
  Product(
    name: 'Short Sleeve Henley',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81tpGc13OgL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81oNSlos2tL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/819ea2vQIjL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91SH0RB-8dL.jpg'
    ],
    cost: 17.99,
    category: _mensCategory,
    productType: 'Shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Polo RL V-Neck',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/61m68nuygSL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61URnzIoCPL.jpg',
    ],
    cost: 24.99,
    category: _mensCategory,
    productType: 'Shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Athletic-Fit Stretch Jeans',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/91SIuLNN%2BlL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Qpp%2BRPLtL.jpg',
    ],
    cost: 29.99,
    category: _mensCategory,
    productType: 'Jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Jeans",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/91L4zjZKF-L.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Mf37jbSvL.jpg',
    ],
    cost: 39.99,
    category: _mensCategory,
    productType: 'Jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Performance Shorts',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L.jpg',
    ],
    cost: 19.99,
    category: _mensCategory,
    productType: 'Shorts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Cargo Shorts",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/915Io2JEUPL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91WJgn0FNkL.jpg',
    ],
    cost: 29.99,
    category: _mensCategory,
    productType: 'Shorts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Polar Fleece Jacket',
    imageUrls: <String>[
      'https://m.media-amazon.com/images/I/81McI2xG3NS.jpg',
      'https://m.media-amazon.com/images/I/81JkH4LbxnS.jpg',
    ],
    cost: 15.80,
    category: _mensCategory,
    productType: 'Jackets',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: '"Columbia Ii Jacket',
    imageUrls: <String>[
      'https://m.media-amazon.com/images/I/6142UY8xXeS.jpg',
      'https://m.media-amazon.com/images/I/61cdxXOfjvS.jpg',
    ],
    cost: 54.99,
    category: _mensCategory,
    productType: 'Jackets',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Short-Sleeve Crewneck',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/911mb8PkHSL.jpg',
      'https://m.media-amazon.com/images/I/71R4QBliLPL.jpg',
    ],
    cost: 16.99,
    category: _womensCategory,
    productType: 'Shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Knit Tunic Blouse',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/71lDML8KDQL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61Ojm-DnojL.jpg',
    ],
    cost: 22.99,
    category: _womensCategory,
    productType: 'Shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Long Sleeve Tops',
    imageUrls: <String>[
      'https://m.media-amazon.com/images/I/81dmPaYpNnL.jpg',
      'https://m.media-amazon.com/images/I/71BqfxMdeDL.jpg',
    ],
    cost: 25.99,
    category: _womensCategory,
    productType: 'Shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Mid-Rise Skinny Jeans',
    imageUrls: <String>[
      'https://m.media-amazon.com/images/I/61HiJeSL51L.jpg',
      'https://m.media-amazon.com/images/I/61j2mpdFRqL.jpg',
    ],
    cost: 28.99,
    category: _womensCategory,
    productType: 'Jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's 505 Jeans",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL.jpg',
    ],
    cost: 34.99,
    category: _womensCategory,
    productType: 'Jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's 715 Bootcut Jeans",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81QwSgeXHTL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81qmkt1Be0L.jpg',
    ],
    cost: 34.99,
    category: _womensCategory,
    productType: 'Jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Squeaky Plush Dog Toy',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/712YaF31-3L.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71K1NzmHCfL.jpg',
    ],
    cost: 9.99,
    category: _petsCategory,
    productType: 'Toys',
  ),
  Product(
    name: 'Wobble Wag Giggle Ball',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81XyqDXVwCL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81Ye9KrP3pL.jpg',
    ],
    cost: 11.99,
    category: _petsCategory,
    productType: 'Toys',
  ),
  Product(
    name: 'Duck Hide Twists',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/51dS9c0xIdL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81z4lvRtc5L.jpg',
    ],
    cost: 8.99,
    category: _petsCategory,
    productType: 'Treats',
  ),
  Product(
    name: "Zuke's Training Treats",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L.jpg',
    ],
    cost: 10.99,
    category: _petsCategory,
    productType: 'Treats',
  ),
];
