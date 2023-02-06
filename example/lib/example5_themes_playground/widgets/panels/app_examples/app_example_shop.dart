import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../shared/utils/app_scroll_behavior.dart';

// An example shop that show what an app using the theme might look like.
//
// This UI I slight modification and modernization of of Flutter UI
// E-Commerce application https://flutterui.design/components/ecommerce
// Original version made by Zachery Gentry, zach@flutterui.design @zacherygentry
// Thanks, rights and credits belong to Zachery for letting me use the shop
// example app in the Themes Playground.

const String manLookRightImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/man-look-right.jpg';
const String dogImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/pet.jpg';
const String womanLookLeftImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/woman-look-left.jpg';

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
    const EdgeInsets listViewPadding =
        EdgeInsets.symmetric(horizontal: 16, vertical: 24);
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
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          title: SearchBar(
            onChanged: setSearchString,
          ),
          actions: const <Widget>[
            CartAppBarAction(),
          ],
        ),
        body: searchString.isNotEmpty
            ? GridView.count(
                padding: listViewPadding,
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
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
                    imageUrl: manLookRightImageUrl,
                    category: mensCategory,
                    imageAlignment: Alignment.topCenter,
                  ),
                  const SizedBox(height: 16),
                  CategoryTile(
                    imageUrl: womanLookLeftImageUrl,
                    category: womensCategory,
                    imageAlignment: Alignment.topCenter,
                  ),
                  const SizedBox(height: 16),
                  CategoryTile(
                    imageUrl: dogImageUrl,
                    category: petsCategory,
                  ),
                ],
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

    final Color background = isLight
        ? theme.colorScheme.surfaceVariant
        : theme.colorScheme.onSurface;
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          CartAppBarAction(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .35,
            color: background,
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    selectedImageUrl!,
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
                            'libero '
                            'vel, feugiat ante. Vestibulum tempor, ligula.',
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
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
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
  late List<Product> _products;

  @override
  void initState() {
    selection = category.selections.first;
    _products = products.where((Product p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductRow> productRows = category.selections
        .map((String s) => ProductRow(
              productType: s,
              products: _products
                  .where((Product p) =>
                      p.productType.toLowerCase() == s.toLowerCase())
                  .toList(),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
        actions: const <Widget>[
          CartAppBarAction(),
        ],
      ),
      body: ScrollConfiguration(
        behavior: const DragScrollBehavior(),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 18),
          itemCount: productRows.length,
          itemBuilder: (_, int index) => productRows[index],
          separatorBuilder: (_, int index) => const SizedBox(
            height: 18,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Text(
                  productType,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 210,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: productTiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, int index) => productTiles[index],
                  separatorBuilder: (_, int index) => const SizedBox(
                    width: 24,
                  ),
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
    return GestureDetector(
      onTap: () {
        unawaited(SystemSound.play(SystemSoundType.click));
        _pushScreen(
          context: context,
          screen: ProductScreen(product: product),
        );
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductImage(product: product),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleSmall,
            ),
            const Spacer(),
            Text(
              '\$${product.cost}',
              style: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.tertiary,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
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
        ? theme.colorScheme.onInverseSurface
        : theme.colorScheme.inverseSurface;
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: background,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls.first,
          loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) =>
              loadingProgress == null
                  ? child
                  : const Center(child: CircularProgressIndicator()),
          color: background,
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
              SizedBox(
                width: 125,
                child: ProductImage(
                  product: item.product,
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

    return Scaffold(
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
      body: Column(
        children: <Widget>[
          if (orderItemRows.isNotEmpty)
            Expanded(
              child: ScrollConfiguration(
                behavior: const DragScrollBehavior(),
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  itemCount: orderItemRows.length,
                  itemBuilder: (_, int index) => orderItemRows[index],
                  separatorBuilder: (_, int index) => const SizedBox(
                    height: 16,
                  ),
                ),
              ),
            )
          else
            const Expanded(
              child: Center(
                child: Text('Your cart is empty'),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '\$${cart.totalCost.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall,
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
          const SizedBox(height: 16),
        ],
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

  /// Which part of the image to prefer
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final Color background = isLight
        ? theme.colorScheme.onInverseSurface
        : theme.colorScheme.inverseSurface;
    return InkWell(
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
            Image.network(
              imageUrl,
              color: background,
              colorBlendMode: BlendMode.multiply,
              alignment: imageAlignment,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.title.toUpperCase(),
                style: theme.textTheme.displayMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
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
        prefixIcon: const Icon(
          Icons.search,
        ),
        hintText: 'Search for a product',
        suffixIcon: IconButton(
          constraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          splashRadius: 24,
          icon: const Icon(
            Icons.clear,
          ),
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
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => screen,
    ),
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

class OrderItem {
  Product product;
  // Selected size of product; This can be null
  String? selectedSize;
  // Selected color of product; This can be null
  String? selectedColor;
  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}

Category mensCategory = Category(title: 'Men', selections: <String>[
  'Shirts',
  'Jeans',
  'Shorts',
  'Jackets',
]);
Category womensCategory = Category(title: 'Women', selections: <String>[
  'Shirts',
  'Jeans',
]);
Category petsCategory = Category(title: 'Pets', selections: <String>[
  'Toys',
  'Treats',
]);

final Color kGreyBackground = Colors.grey[200]!;

List<Product> products = <Product>[
  Product(
      name: '2-Pack Crewneck T-Shirts - Black',
      imageUrls: <String>[
        'https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg',
        'https://m.media-amazon.com/images/I/716CJVk6FLS._AC_UY500_.jpg',
        'https://m.media-amazon.com/images/I/81AVnzFKUqS._AC_UY500_.jpg',
      ],
      cost: 12.99,
      category: mensCategory,
      productType: 'shirts',
      sizes: <String>['S', 'M', 'L', 'XL']),
  Product(
    name: 'Short Sleeve Henley - Blue',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81tpGc13OgL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81oNSlos2tL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/819ea2vQIjL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91SH0RB-8dL._AC_UY606_.jpg'
    ],
    cost: 17.99,
    category: mensCategory,
    productType: 'shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Polo RL V-Neck',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/61m68nuygSL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61URnzIoCPL._AC_UX522_.jpg',
    ],
    cost: 24.99,
    category: mensCategory,
    productType: 'shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Athletic-Fit Stretch Jeans',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/91SIuLNN%2BlL._AC_UY679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Qpp%2BRPLtL._AC_UX522_.jpg',
    ],
    cost: 29.99,
    category: mensCategory,
    productType: 'jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Original Jeans",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/91L4zjZKF-L._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91Mf37jbSvL._AC_UX522_.jpg',
    ],
    cost: 39.99,
    category: mensCategory,
    productType: 'jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: '2-Pack Performance Shorts',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L._AC_UX522_.jpg',
    ],
    cost: 19.99,
    category: mensCategory,
    productType: 'shorts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Cargo Shorts",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/915Io2JEUPL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/91WJgn0FNkL._AC_UX679_.jpg',
    ],
    cost: 29.99,
    category: mensCategory,
    productType: 'shorts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Full-Zip Polar Fleece Jacket',
    imageUrls: <String>[
      'https://m.media-amazon.com/images/I/81McI2xG3NS._AC_UY500_.jpg',
      'https://m.media-amazon.com/images/I/81JkH4LbxnS._AC_UY500_.jpg',
    ],
    cost: 15.80,
    category: mensCategory,
    productType: 'jackets',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Columbia Men's Watertight Ii Jacket",
    imageUrls: <String>[
      'https://m.media-amazon.com/images/I/6142UY8xXeS._AC_UX466_.jpg',
      'https://m.media-amazon.com/images/I/61cdxXOfjvS._AC_UX466_.jpg',
    ],
    cost: 54.99,
    category: mensCategory,
    productType: 'jackets',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: '2-Pack Short-Sleeve Crewneck',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/911mb8PkHSL._AC_UX522_.jpg',
      'https://m.media-amazon.com/images/I/71R4QBliLPL._AC_UY500_.jpg',
    ],
    cost: 16.99,
    category: womensCategory,
    productType: 'shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Waffle Knit Tunic Blouse',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/71lDML8KDQL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/61Ojm-DnojL._AC_UY679_.jpg',
    ],
    cost: 22.99,
    category: womensCategory,
    productType: 'shirts',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: 'Mid-Rise Skinny Jeans',
    imageUrls: <String>[
      'https://m.media-amazon.com/images/I/61HiJeSL51L._AC_SX466._SX._UX._SY._UY_.jpg',
      'https://m.media-amazon.com/images/I/61j2mpdFRqL._AC_SX466._SX._UX._SY._UY_.jpg',
    ],
    cost: 28.99,
    category: womensCategory,
    productType: 'jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's Straight 505 Jeans",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL._AC_UX679_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL._AC_UX679_.jpg',
    ],
    cost: 34.99,
    category: womensCategory,
    productType: 'jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: "Levi's 715 Bootcut Jeans",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81QwSgeXHTL._AC_UX522_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81qmkt1Be0L._AC_UY679_.jpg',
    ],
    cost: 34.99,
    category: womensCategory,
    productType: 'jeans',
    sizes: <String>['XS', 'S', 'M', 'L', 'XL'],
  ),
  Product(
    name: '3-Pack - Squeaky Plush Dog Toy',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/712YaF31-3L._AC_SL1000_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/71K1NzmHCfL._AC_SL1000_.jpg',
    ],
    cost: 9.99,
    category: petsCategory,
    productType: 'toys',
  ),
  Product(
    name: 'Wobble Wag Giggle Ball',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81XyqDXVwCL._AC_SX355_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81Ye9KrP3pL._AC_SY355_.jpg',
    ],
    cost: 11.99,
    category: petsCategory,
    productType: 'toys',
  ),
  Product(
    name: 'Duck Hide Twists',
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/51dS9c0xIdL._SX342_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81z4lvRtc5L._SL1500_.jpg',
    ],
    cost: 8.99,
    category: petsCategory,
    productType: 'treats',
  ),
  Product(
    name: "Zuke's Mini Training Treats",
    imageUrls: <String>[
      'https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL._AC_SY355_.jpg',
      'https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L._AC_SY355_.jpg',
    ],
    cost: 10.99,
    category: petsCategory,
    productType: 'treats',
  ),
];
