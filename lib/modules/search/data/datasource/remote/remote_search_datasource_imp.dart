import '../../../../home/data/models/product_model.dart';
import '../../../../home/domain/entities/product_entity.dart';
import '../remote_search_datasource.dart';


class RemoteSearchDatasourceImp extends RemoteSearchDatasource {
  @override
  Future<List<ProductEntity>> search(String search) async {
    final List<ProductEntity> foundProducts = [];

    for (var productMap in mockedData) {
      final product = ProductModel.fromJson(productMap);

      if (product.categoria.toLowerCase().contains(search.toLowerCase()) ||
          product.titulo.toLowerCase().contains(search.toLowerCase())) {
        foundProducts.add(product);
      }
    }
    await Future.delayed(const Duration(seconds: 2));

    return foundProducts;
  }
}

final mockedData = [
  {
    "categoria": "Anestésicos e Agulhas Gengivais",
    "data_anuncio": "Hoje",
    "titulo": "Anestésico Local 10ml",
    "desconto": null,
    "preco_antigo": null,
    "preco": 89.99,
    "novo": true,
    "parcelas": {"quantidade": 3, "preco_parcela": 29.99},
    "imagem": "https://exemplo.com/imagem16.jpg"
  },
  {
    "categoria": "Biosegurança",
    "data_anuncio": "Hoje",
    "titulo": "Kit de EPIs",
    "desconto": null,
    "preco_antigo": null,
    "preco": 89.99,
    "novo": true,
    "parcelas": {"quantidade": 3, "preco_parcela": 29.99},
    "imagem": "https://exemplo.com/imagem16.jpg"
  },
  {
    "categoria": "Anestésicos e Agulhas Gengivais",
    "data_anuncio": "Ontem",
    "titulo": "Agulha Gengival Descartável (Pacote com 100)",
    "desconto": "15%",
    "preco_antigo": 12.0,
    "preco": 10.20,
    "novo": false,
    "parcelas": {"quantidade": 2, "preco_parcela": 5.10},
    "imagem": "https://exemplo.com/imagem2.jpg"
  },
  {
    "categoria": "Biosegurança",
    "data_anuncio": "15 de Agosto de 2023",
    "titulo": "Máscara Descartável (Pacote com 50)",
    "desconto": "10%",
    "preco_antigo": 20.0,
    "preco": 18.00,
    "novo": false,
    "parcelas": {"quantidade": 2, "preco_parcela": 9.00},
    "imagem": "https://exemplo.com/imagem4.jpg"
  },
  {
    "categoria": "Dentística e Estética",
    "data_anuncio": "15 de Agosto de 2023",
    "titulo": "Resina Composta para Restauração",
    "desconto": "12%",
    "preco_antigo": 40.0,
    "preco": 35.20,
    "novo": false,
    "parcelas": {"quantidade": 1, "preco_parcela": 35.20},
    "imagem": "https://exemplo.com/imagem8.jpg"
  },
  {
    "categoria": "Periféricos e Peças de Mão",
    "data_anuncio": "15 de Agosto de 2023",
    "titulo": "Micromotor Odontológico",
    "desconto": "15%",
    "preco_antigo": 180.0,
    "preco": 153.00,
    "novo": false,
    "parcelas": {"quantidade": 3, "preco_parcela": 51.00},
    "imagem": "https://exemplo.com/imagem14.jpg"
  },
  {
    "categoria": "Endodontia",
    "data_anuncio": "14 de Agosto de 2023",
    "titulo": "Obturação Endodôntica (Pacote com 4)",
    "desconto": "10%",
    "preco_antigo": 30.0,
    "preco": 27.00,
    "novo": false,
    "parcelas": {"quantidade": 2, "preco_parcela": 13.50},
    "imagem": "https://exemplo.com/imagem12.jpg"
  },
  {
    "categoria": "Ortodontia",
    "data_anuncio": "14 de Agosto de 2023",
    "titulo": "Aparelho Ortodôntico Metálico",
    "desconto": "8%",
    "preco_antigo": 200.0,
    "preco": 184.00,
    "novo": false,
    "parcelas": {"quantidade": 3, "preco_parcela": 61.33},
    "imagem": "https://exemplo.com/imagem9.jpg"
  },
  {
    "categoria": "Descartáveis",
    "data_anuncio": "13 de Agosto de 2023",
    "titulo": "Seringa Descartável 5ml (Pacote com 50)",
    "desconto": "10%",
    "preco_antigo": 15.0,
    "preco": 13.50,
    "novo": false,
    "parcelas": {"quantidade": 1, "preco_parcela": 13.50},
    "imagem": "https://exemplo.com/imagem6.jpg"
  },
  {
    "categoria": "Periféricos e Peças de Mão",
    "data_anuncio": "13 de Agosto de 2023",
    "titulo": "Peça de Mão para Alta Rotação",
    "desconto": "12%",
    "preco_antigo": 150.0,
    "preco": 132.00,
    "novo": false,
    "parcelas": {"quantidade": 3, "preco_parcela": 44.00},
    "imagem": "https://exemplo.com/imagem13.jpg"
  },
  {
    "categoria": "Descartáveis",
    "data_anuncio": "12 de Agosto de 2023",
    "titulo": "Luvas Descartáveis (100 unidades)",
    "desconto": "5%",
    "preco_antigo": 25.0,
    "preco": 23.75,
    "novo": false,
    "parcelas": {"quantidade": 1, "preco_parcela": 23.75},
    "imagem": "https://exemplo.com/imagem5.jpg"
  },
  {
    "categoria": "Ortodontia",
    "data_anuncio": "12 de Agosto de 2023",
    "titulo": "Fio Elástico Ortodôntico (Pacote com 100)",
    "desconto": "10%",
    "preco_antigo": 18.0,
    "preco": 16.20,
    "novo": false,
    "parcelas": {"quantidade": 1, "preco_parcela": 16.20},
    "imagem": "https://exemplo.com/imagem10.jpg"
  },
  {
    "categoria": "Endodontia",
    "data_anuncio": "11 de Agosto de 2023",
    "titulo": "Limas Endodônticas (Pacote com 6)",
    "desconto": "8%",
    "preco_antigo": 40.0,
    "preco": 36.80,
    "novo": false,
    "parcelas": {"quantidade": 3, "preco_parcela": 12.27},
    "imagem": "https://exemplo.com/imagem11.jpg"
  },
  {
    "categoria": "Biosegurança",
    "data_anuncio": "10 de Agosto de 2023",
    "titulo": "Álcool em Gel 500ml",
    "desconto": "8%",
    "preco_antigo": 10.0,
    "preco": 9.20,
    "novo": false,
    "parcelas": {"quantidade": 1, "preco_parcela": 9.20},
    "imagem": "https://exemplo.com/imagem3.jpg"
  },
  {
    "categoria": "Dentística e Estética",
    "data_anuncio": "10 de Agosto de 2023",
    "titulo": "Clareamento Dental Kit",
    "desconto": "15%",
    "preco_antigo": 60.0,
    "preco": 51.00,
    "novo": false,
    "parcelas": {"quantidade": 3, "preco_parcela": 17.00},
    "imagem": "https://exemplo.com/imagem7.jpg"
  },
];
