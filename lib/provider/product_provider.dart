import 'package:brico_voisin/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  String _error = '';

  List<Product> get products =>
      _filteredProducts.isEmpty ? _products : _filteredProducts;
  bool get isLoading => _isLoading;
  String get error => _error;

  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // Récupérer tous les produits depuis la base de données
  Future<void> fetchProducts() async {
    _setLoading(true);
    _resetError();

    try {
      final response = await _supabaseClient.from('products').select();

      if (response != null && response is List) {
        _products = response.map((item) => Product.fromJson(item)).toList();
        _filteredProducts = _products; // Au départ, on montre tous les produits
      } else {
        throw 'Aucun produit trouvé';
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Filtrer les produits par thème
  void setFilterByTheme(String theme) {
    _filteredProducts = _products.where((product) {
      return product.theme.contains(theme); // Filtrer si le thème correspond
    }).toList();
    notifyListeners();
  }

  // Méthodes auxiliaires pour gérer l'état
  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _resetError() {
    _error = '';
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }
}
