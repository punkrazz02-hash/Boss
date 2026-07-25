import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/transaction_model.dart';

final transactionProvider = StateNotifierProvider<TransactionNotifier, List<Transaction>>((ref) {
  return TransactionNotifier();
});

class TransactionNotifier extends StateNotifier<List<Transaction>> {
  TransactionNotifier() : super([]);

  void addTransaction(Transaction transaction) {
    state = [transaction, ...state];
  }

  void removeTransaction(String transactionId) {
    state = state.where((t) => t.id != transactionId).toList();
  }

  void setTransactions(List<Transaction> transactions) {
    state = transactions;
  }

  List<Transaction> getRecentTransactions({int limit = 5}) {
    return state.take(limit).toList();
  }

  double getTotalIncome() {
    return state
        .where((t) => t.type == TransactionType.income)
        .fold(0.0, (sum, t) => sum + t.amount);
  }

  double getTotalExpense() {
    return state
        .where((t) => t.type == TransactionType.expense)
        .fold(0.0, (sum, t) => sum + t.amount);
  }
}
