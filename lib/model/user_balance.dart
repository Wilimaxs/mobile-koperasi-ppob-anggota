class UserBalance {
  final String? balance;
  final String? formatBalance;

  UserBalance({this.balance, this.formatBalance});

  factory UserBalance.fromJson(Map<String, dynamic> json) {
    return UserBalance(
      balance: json['balance'],
      formatBalance: json['format_balance'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'balance': balance, 'format_balance': balance};
  }
}
