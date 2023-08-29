import '../../domain/entities/product_entity.dart';
import 'installments_model.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.categoria,
    required super.dataAnuncio,
    required super.titulo,
    super.desconto,
    super.precoAntigo,
    required super.preco,
    required super.novo,
    required super.parcelas,
    required super.imagem,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      categoria: json['categoria'],
      dataAnuncio: json['data_anuncio'],
      titulo: json['titulo'],
      desconto: json['desconto'],
      precoAntigo: json['preco_antigo'],
      preco: json['preco'],
      novo: json['novo'],
      parcelas: InstallmentsModel.fromJson(json['parcelas']),
      imagem: json['imagem']);
}
//TODO: excluir
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = <String, dynamic>{};
//    data['categoria'] = categoria;
//    data['data_anuncio'] = dataAnuncio;
//    data['titulo'] = titulo;
//    data['desconto'] = desconto;
//    data['preco_antigo'] = precoAntigo;
//    data['preco'] = preco;
//    data['novo'] = novo;
//    if (parcelas != null) {
//      data['parcelas'] = parcelas!.toJson();
//    }
//    data['imagem'] = imagem;
//    return data;
//  }
//}
