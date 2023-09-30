import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/index_manager.dart';

class CreaditCardAddView extends StatefulWidget {
  const CreaditCardAddView({super.key});

  @override
  State<CreaditCardAddView> createState() => _CreaditCardAddViewState();
}

class _CreaditCardAddViewState extends State<CreaditCardAddView> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: SvgPicture.asset(ImageAssets.arrowBack)),
        ),
        title: Text("Card Details",
            style: getboldStyle(
                color: ColorManager.blackColor, fontSize: FontSize.s14)),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //const SizedBox(height: 30),
            CreditCardWidget(
              glassmorphismConfig: //Glassmorphism.defaultConfig(),
                  Glassmorphism(
                blurX: 0.5,
                blurY: 0.5,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    // Colors.greenAccent.withAlpha(20),
                    // Colors.white.withAlpha(20),
                    Colors.blueAccent,
                    Colors.blueAccent,
                  ],
                  // stops: const <double>[
                  //   0.5,
                  //   0,
                  // ],
                ),
              ),
              // useGlassMorphism ? Glassmorphism.defaultConfig() : null,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: '  ',
              //bankName: 'Axis Bank',

              frontCardBorder: Border.all(color: Colors.grey),
              //!useGlassMorphism ? Border.all(color: Colors.grey) : null,
              backCardBorder: Border.all(color: Colors.grey),
              // !useGlassMorphism ? Border.all(color: Colors.grey) : null,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              //cardBgColor: Colors.black,
              //cardBgColor: Colors.transparent,
              backgroundImage: ImageAssets.visacard2,
              // textStyle: TextStyle(color: Colors.black),
              // useBackgroundImage ? ImageAssets.visacard1 : null,
              //  backgroundImage: useBackgroundImage ? 'assets/card_bg.png' : null,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.visa,
                  cardImage: SvgPicture.asset(
                    ImageAssets.visaName,
                    height: 20,
                    width: 18,
                  ),
                  // cardImage: Image.asset(
                  //   'assets/mastercard.png',
                  //   height: 48,
                  //   width: 48,
                  // ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.blue,
                      textColor: Colors.black,
                      cardNumberDecoration: InputDecoration(
                        labelText: 'Number',
                        hintText: 'XXXX XXXX XXXX XXXX',
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        helperStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                      ),
                      expiryDateDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Expired Date',
                        hintText: 'XX/XX',
                      ),
                      cvvCodeDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'CVV',
                        hintText: 'XXX',
                      ),
                      cardHolderDecoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(color: Colors.black),
                        focusedBorder: border,
                        enabledBorder: border,
                        labelText: 'Card Holder',
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: _onValidate,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          // gradient: LinearGradient(
                          //   colors: <Color>[
                          //     ColorManager.primary,
                          //     ColorManager.colonoscopyColor,
                          //     ColorManager.darkGrey,
                          //     ColorManager.primary,
                          //     ColorManager.primary,
                          //     ColorManager.primary,
                          //     ColorManager.primary
                          //   ],
                          //   begin: Alignment(-1, -4),
                          //   end: Alignment(1, 4),
                          // ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Pay Now',
                          style: getmediumStyle(
                              color: ColorManager.whiteColor,
                              fontSize: AppSize.s14),
                        ),
                        // TextStyle(
                        //   color: Colors.white,
                        //   fontFamily: 'halter',
                        //   fontSize: 14,
                        //   package: 'flutter_credit_card',
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onValidate() {
    Navigator.pushReplacementNamed(context, Routes.Onboarding1Route);
    if (formKey.currentState!.validate()) {
      print('valid!');

      // print("Api calling");
      // var expMonth = expiryDate.split('/').first;
      // var expYear = expiryDate.split('/').last;
      // _userCardController.onSaveCardButton(
      //     cardNumber: cardNumber.replaceAll(' ', ''),
      //     expMonth: expMonth,
      //     expYear: expYear,
      //     cvc: cvvCode);
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
