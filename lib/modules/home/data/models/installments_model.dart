import '../../domain/entities/installments_entity.dart';

class InstallmentsModel extends InstallmentsEntity {
  InstallmentsModel({required super.quantidade, required super.precoParcela});

  factory InstallmentsModel.fromJson(Map<String, dynamic> json) =>
      InstallmentsModel(quantidade: json['quantidade'] ?? 0, precoParcela: json['preco_parcela'] ?? " ");

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantidade'] = quantidade;
    data['preco_parcela'] = precoParcela;
    return data;
  }
}
