class Transaction {
  final String id;
  final String userId;
  final String title;
  final String category;
  final double amount;
  final TransactionType type;
  final DateTime date;
  final String? note;
  final String? receiptUrl;
  final List<String> tags;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.title,
    required this.category,
    required this.amount,
    required this.type,
    required this.date,
    this.note,
    this.receiptUrl,
    required this.tags,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: TransactionType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      date: DateTime.parse(json['date'] as String),
      note: json['note'] as String?,
      receiptUrl: json['receiptUrl'] as String?,
      tags: List<String>.from(json['tags'] as List? ?? []),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'category': category,
      'amount': amount,
      'type': type.toString().split('.').last,
      'date': date.toIso8601String(),
      'note': note,
      'receiptUrl': receiptUrl,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

enum TransactionType {
  income,
  expense,
  transfer,
}
