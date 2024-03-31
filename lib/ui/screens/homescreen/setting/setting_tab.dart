import 'package:flutter/material.dart';

class Settingtab extends StatefulWidget {
  const Settingtab({super.key});

  @override
  State<Settingtab> createState() => _SettingtabState();
}

class _SettingtabState extends State<Settingtab> {
  String language="English";
  String currenlanguge="Language";
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Padding(
          padding: EdgeInsets.only(left: 30, top: 30, right: 30),
          child: Text(
           currenlanguge,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          height: 57,
          width: MediaQuery.of(context)!.size.width * .2,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff39A552)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.only(left: 30, top: 2, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                language,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Color(0xff39A552)),
              ),
              IconButton(
                onPressed: () {
                  viwebottomsheetlanguage();
                },
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
      ],
    );
  }
  void viwebottomsheetlanguage() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        side: BorderSide(width: 6),
      ),
      context: context,
      builder: (_) => Container(
        margin: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    language = "English";
                    currenlanguge="Language";
                  });
                  Navigator.pop(context);
                },
                child: const Text("English", textAlign: TextAlign.left),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    language = "العربيه";
                    currenlanguge="اللغه";
                  });
                  Navigator.pop(context);
                },
                child: const Text("العربيه", textAlign: TextAlign.left),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
