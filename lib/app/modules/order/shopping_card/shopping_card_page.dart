import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/core/ui/widgets/vakinha_button.dart';
import 'package:validatorless/validatorless.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  const ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constrains) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
              minWidth: constrains.maxWidth,
            ),
            child: IntrinsicHeight(
              child: Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Carrinho",
                              style: context.textTheme.headline6?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColorDark,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: 
                          controller.products.map((p) => Container(
                            margin: const EdgeInsets.all(10),
                            child: PlusMinusBox(
                                label: p.product.name,
                                calculateTotal: true,
                                elevated: true,
                                backgroundColor: Colors.white,
                                quantity: p.quantity,
                                price: p.product.price,
                                plusCallBack: () {},
                                minusCallBack: () {}),
                          )).toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total do pedido',
                              style: context.textTheme.bodyText1
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(FormatterHelper.formatCurrency(controller.totalValue),
                                style: context.textTheme.bodyText1
                                    ?.copyWith(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      const Divider(),
                      const _AddressField(),
                      const Divider(),
                      const _CpfField(),
                      const Divider(),
                      const Spacer(),
                      Center(
                        child: SizedBox(
                          width: context.widthTransformer(reducedBy: 10),
                          child: VakinhaButton(
                            label: 'FINALIZAR',
                            onPressed: (){},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                   ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 35,
          child: Expanded(
            child: Text(
              'Endereço de entrega',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {},
          validator: Validatorless.required('Endereço obrigatório'),
          decoration: const InputDecoration(
              hintText: 'Digite o endereço',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}

class _CpfField extends GetView<ShoppingCardController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 35,
          child: Expanded(
            child: Text(
              'CPF',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {},
          validator: Validatorless.multiple([
            Validatorless.required('CPF obrigatorio'),
            Validatorless.cpf('CPF inválido'),
          ]),
          decoration: const InputDecoration(
              hintText: 'Digite o CPF',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey))),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
