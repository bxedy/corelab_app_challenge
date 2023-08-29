import 'installments_entity.dart';

class ProductEntity {
  final String categoria;
  final String dataAnuncio;
  final String titulo;
  final String? desconto;
  final double? precoAntigo;
  final double preco;
  final bool novo;
  final InstallmentsEntity parcelas;
  final String imagem;

  ProductEntity({
    required this.categoria,
    required this.dataAnuncio,
    required this.titulo,
    required this.desconto,
    required this.precoAntigo,
    required this.preco,
    required this.novo,
    required this.parcelas,
    required this.imagem,
  });
}
