import 'package:brico_voisin/model/product.dart';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _error = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get error => _error;

  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _supabaseClient.from('products').select();

      _products =
          (response as List).map((item) => Product.fromJson(item)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Vous pouvez ajouter d'autres méthodes ici, comme fetchProductsByUser
  Future<void> fetchProductsByUser(String userId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response =
          await _supabaseClient.from('products').select().eq('userId', userId);

      _products =
          (response as List).map((item) => Product.fromJson(item)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
