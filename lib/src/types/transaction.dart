import 'package:json_annotation/json_annotation.dart';
import 'package:solana/src/types/json_rpc_response_object.dart';
import 'package:solana/src/types/tx_meta.dart';

part 'transaction.g.dart';

@JsonSerializable(createToJson: false)
class ConfirmedTransactionResponse
    extends JsonRpcResponse<ConfirmedTransaction?> {
  ConfirmedTransactionResponse(ConfirmedTransaction? result)
      : super(result: result);

  factory ConfirmedTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmedTransactionResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ConfirmedTransaction {
  ConfirmedTransaction({
    this.meta,
    required this.slot,
    required this.blockTime,
  });

  factory ConfirmedTransaction.fromJson(Map<String, dynamic> json) =>
      _$ConfirmedTransactionFromJson(json);

  final TxMeta? meta;
  final int slot;
  final int blockTime;
}

@JsonSerializable(createToJson: false)
class Transaction {
  Transaction({required this.message});

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  final TxMessage message;
}

@JsonSerializable(createToJson: false)
class TxMessage {
  TxMessage({this.instructions});

  factory TxMessage.fromJson(Map<String, dynamic> json) =>
      _$TxMessageFromJson(json);

  final Iterable<TxInstruction>? instructions;
}

abstract class TxInstruction {
  factory TxInstruction.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'transfer':
        return TransferTx.fromJson(
          json['parsed']['info'] as Map<String, dynamic>,
        );
      default:
        throw FallThroughError();
    }
  }
}

@JsonSerializable(createToJson: false)
class TransferTx implements TxInstruction {
  TransferTx({
    required this.source,
    required this.destination,
    required this.lamports,
  });

  factory TransferTx.fromJson(Map<String, dynamic> json) =>
      _$TransferTxFromJson(json);

  final String source;
  final String destination;
  final int lamports;
}
