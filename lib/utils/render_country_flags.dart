import 'package:flutter/material.dart';

List<Widget> buildCountryFlags(List<String> countryCodes) {
  return countryCodes.map((code) {
    var countryCode = code.toLowerCase();
    var assetName = "icons/flags/png100px/$countryCode.png";
    var assetPackage = 'country_icons';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Image.asset(
        assetName,
        package: assetPackage,
        width: 44,
      ),
    );
  }).toList();
}