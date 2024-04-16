part of 'package:lnwCoin/view/market/top_bar_list/coin.dart';

class _MarketDataCard extends StatelessWidget {
  const _MarketDataCard(
      {required this.marketViewModel,
      required this.index,
      required this.coins,
      required this.function});
  final MarketViewModel marketViewModel;
  final int index;
  final List<CryptoCurrency> coins;
  final Function function;

  @override
  Widget build(BuildContext context) {
    print(coins[index].symbol);
    final bool isMinus =
        coins[index].priceChangePercentage24h.toString().startsWith('-');
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: InkWell(
          onTap: () {
            function();
            marketViewModel.navigateToTradeView(
                context, index, coins[index].symbol);
          },
          child: Card(
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.network(coins[index].image)),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                coins[index].symbol,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Container(
                          height: 50,
                          child: Sparkline(
                            data: coins[index].sparklineIn7d,
                            useCubicSmoothing: true,
                            cubicSmoothingFactor: 0.2,
                            lineGradient: isMinus
                                ? const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.redAccent, Colors.red])
                                : const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.greenAccent, Colors.green]),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Text(
                          "\$${coins[index].currentPrice.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")}",
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            color: isMinus
                                ? const Color.fromARGB(255, 232, 22, 64)
                                : const Color.fromARGB(255, 4, 209, 109),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: isMinus
                                  ? Text(
                                      coins[index]
                                          .priceChangePercentage24h
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      '+${coins[index].priceChangePercentage24h}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                        )),
                  ],
                ),
              )),
        ));
  }
}

// Card(
//             color: Colors.white.withOpacity(0.5),
//             child: ListTile(
//               textColor: Colors.black,
//               title: Row(
//                 children: [
//                   Text(
//                     coins[index].symbol.toString(),
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                         fontSize: 18),
//                   ),
//                   SizedBox(width: 15,),
//                   Flexible (
//                     child: Container(
//                       height: 50,
//                       child: Sparkline(
//                         data: coins[index].sparklineIn7d,
//                         useCubicSmoothing: true,
//                         cubicSmoothingFactor: 0.2,
//                         lineGradient: const LinearGradient(
//                             begin: Alignment.topCenter,
//                             end: Alignment.bottomCenter,
//                             colors: [Colors.greenAccent, Colors.green]),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     "\$${coins[index].currentPrice.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")}",
//                     style: const TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     height: 30,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       color: isMinus
//                           ? const Color.fromARGB(255, 232, 22, 64)
//                           : const Color.fromARGB(255, 4, 209, 109),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(
//                         child: isMinus
//                             ? Text(
//                                 coins[index]
//                                     .priceChangePercentage24h
//                                     .toString(),
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             : Text(
//                                 '+${coins[index].priceChangePercentage24h}',
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                   )
//                 ],
//               ),
//               leading: SizedBox(
//                   height: 30,
//                   width: 30,
//                   child: Image.network(coins[index].image)),
//             ),
//           ),