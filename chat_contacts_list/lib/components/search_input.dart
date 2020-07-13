import 'package:chat_contacts_list/components/count_marker.dart';
import 'package:chat_contacts_list/constraints.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final IconData icon;
  final String text;
  final int count;
  final bool addRightMargin;
  final bool disabled;
  final bool isSearchFocused;
  final bool showDetailedCount;
  final Function onCountClick;
  final Function onChange;
  final Function onTap;
  final TextEditingController controller;

  const SearchInput(
      {Key key,
      this.icon,
      this.text,
      this.count,
      this.addRightMargin,
      this.disabled,
      this.isSearchFocused = false,
      this.showDetailedCount = false,
      this.onCountClick,
      this.onChange,
      this.onTap,
      this.controller})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 39,
      margin: this.addRightMargin
          ? EdgeInsets.only(right: 7, bottom: 7)
          : EdgeInsets.only(bottom: 7),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: <Widget>[
          TextField(
            controller: this.controller,
            onChanged: (value) {
              this.onChange(value);
            },
            onTap: onTap,
            readOnly: this.disabled,
            decoration: InputDecoration(
              prefixIcon: Icon(
                isSearchFocused ? Icons.search : this.icon,
                size: 25,
                color: Color(0xFF131313),
              ),
              border: InputBorder.none,
              hintText: this.text,
              hintStyle: kSearchHintStyle,
            ),
          ),
          Positioned(
            top: 9,
            right: 10,
            child: this.isSearchFocused
                ? InkWell(
                    onTap: (){
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }

                      onTap();
                    },
                    child: Container(
                      width: 23,
                      height: 23,
                      decoration: BoxDecoration(
                        color: Color(0xFF131313).withOpacity(0.03),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Icon(
                        Icons.clear,
                        size: 18,
                        color: Color(0xFF131313),
                      ),
                    ),
                  )
                : CountMarker(text: this.count.toString()),
          )
        ],
      ),
    );
  }
}
