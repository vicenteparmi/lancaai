import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff8b5000),
      surfaceTint: Color(0xff8b5000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffa643),
      onPrimaryContainer: Color(0xff452500),
      secondary: Color(0xff815524),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffcb9a),
      onSecondaryContainer: Color(0xff5d3707),
      tertiary: Color(0xff5a6400),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb4c425),
      onTertiaryContainer: Color(0xff2b3000),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffff8f5),
      onBackground: Color(0xff231a11),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff231a11),
      surfaceVariant: Color(0xfff8dec8),
      onSurfaceVariant: Color(0xff554434),
      outline: Color(0xff887361),
      outlineVariant: Color(0xffdbc2ad),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e25),
      inverseOnSurface: Color(0xffffeee1),
      inversePrimary: Color(0xffffb870),
      primaryFixed: Color(0xffffdcbe),
      onPrimaryFixed: Color(0xff2c1600),
      primaryFixedDim: Color(0xffffb870),
      onPrimaryFixedVariant: Color(0xff693c00),
      secondaryFixed: Color(0xffffdcbe),
      onSecondaryFixed: Color(0xff2c1600),
      secondaryFixedDim: Color(0xfff6bb81),
      onSecondaryFixedVariant: Color(0xff663d0e),
      tertiaryFixed: Color(0xffdced4e),
      onTertiaryFixed: Color(0xff1a1e00),
      tertiaryFixedDim: Color(0xffc0d033),
      onTertiaryFixedVariant: Color(0xff444b00),
      surfaceDim: Color(0xffe9d7c9),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e7),
      surfaceContainer: Color(0xfffdebdc),
      surfaceContainerHigh: Color(0xfff7e5d7),
      surfaceContainerHighest: Color(0xfff1dfd1),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff643800),
      surfaceTint: Color(0xff8b5000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffaa6400),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff613a0a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9b6a38),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff404700),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff707b00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f5),
      onBackground: Color(0xff231a11),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff231a11),
      surfaceVariant: Color(0xfff8dec8),
      onSurfaceVariant: Color(0xff504030),
      outline: Color(0xff6e5c4a),
      outlineVariant: Color(0xff8c7765),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e25),
      inverseOnSurface: Color(0xffffeee1),
      inversePrimary: Color(0xffffb870),
      primaryFixed: Color(0xffaa6400),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff874e00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff9b6a38),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7f5222),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff707b00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff586100),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe9d7c9),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e7),
      surfaceContainer: Color(0xfffdebdc),
      surfaceContainerHigh: Color(0xfff7e5d7),
      surfaceContainerHighest: Color(0xfff1dfd1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff361c00),
      surfaceTint: Color(0xff8b5000),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff643800),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff361c00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff613a0a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff202500),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff404700),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      background: Color(0xfffff8f5),
      onBackground: Color(0xff231a11),
      surface: Color(0xfffff8f5),
      onSurface: Color(0xff000000),
      surfaceVariant: Color(0xfff8dec8),
      onSurfaceVariant: Color(0xff2f2113),
      outline: Color(0xff504030),
      outlineVariant: Color(0xff504030),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff392e25),
      inverseOnSurface: Color(0xffffffff),
      inversePrimary: Color(0xffffe8d5),
      primaryFixed: Color(0xff643800),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff452500),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff613a0a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff452500),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff404700),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2a3000),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe9d7c9),
      surfaceBright: Color(0xfffff8f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1e7),
      surfaceContainer: Color(0xfffdebdc),
      surfaceContainerHigh: Color(0xfff7e5d7),
      surfaceContainerHighest: Color(0xfff1dfd1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffca97),
      surfaceTint: Color(0xffffb870),
      onPrimary: Color(0xff4a2800),
      primaryContainer: Color(0xfff69300),
      onPrimaryContainer: Color(0xff331a00),
      secondary: Color(0xfff6bb81),
      onSecondary: Color(0xff4a2800),
      secondaryContainer: Color(0xff5a3404),
      onSecondaryContainer: Color(0xffffc58e),
      tertiary: Color(0xffccdd3f),
      onTertiary: Color(0xff2e3300),
      tertiaryContainer: Color(0xffa3b30b),
      onTertiaryContainer: Color(0xff1d2100),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff1a120a),
      onBackground: Color(0xfff1dfd1),
      surface: Color(0xff1a120a),
      onSurface: Color(0xfff1dfd1),
      surfaceVariant: Color(0xff554434),
      onSurfaceVariant: Color(0xffdbc2ad),
      outline: Color(0xffa38d7a),
      outlineVariant: Color(0xff554434),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd1),
      inverseOnSurface: Color(0xff392e25),
      inversePrimary: Color(0xff8b5000),
      primaryFixed: Color(0xffffdcbe),
      onPrimaryFixed: Color(0xff2c1600),
      primaryFixedDim: Color(0xffffb870),
      onPrimaryFixedVariant: Color(0xff693c00),
      secondaryFixed: Color(0xffffdcbe),
      onSecondaryFixed: Color(0xff2c1600),
      secondaryFixedDim: Color(0xfff6bb81),
      onSecondaryFixedVariant: Color(0xff663d0e),
      tertiaryFixed: Color(0xffdced4e),
      onTertiaryFixed: Color(0xff1a1e00),
      tertiaryFixedDim: Color(0xffc0d033),
      onTertiaryFixedVariant: Color(0xff444b00),
      surfaceDim: Color(0xff1a120a),
      surfaceBright: Color(0xff42372d),
      surfaceContainerLowest: Color(0xff150d06),
      surfaceContainerLow: Color(0xff231a11),
      surfaceContainer: Color(0xff271e15),
      surfaceContainerHigh: Color(0xff32281f),
      surfaceContainerHighest: Color(0xff3e3329),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffca97),
      surfaceTint: Color(0xffffb870),
      onPrimary: Color(0xff311900),
      primaryContainer: Color(0xfff69300),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffbbf84),
      onSecondary: Color(0xff251200),
      secondaryContainer: Color(0xffbb8651),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffccdd3f),
      onTertiary: Color(0xff1d2000),
      tertiaryContainer: Color(0xffa3b30b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff1a120a),
      onBackground: Color(0xfff1dfd1),
      surface: Color(0xff1a120a),
      onSurface: Color(0xfffffaf8),
      surfaceVariant: Color(0xff554434),
      onSurfaceVariant: Color(0xffdfc6b1),
      outline: Color(0xffb69f8b),
      outlineVariant: Color(0xff947f6d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd1),
      inverseOnSurface: Color(0xff32281f),
      inversePrimary: Color(0xff6b3d00),
      primaryFixed: Color(0xffffdcbe),
      onPrimaryFixed: Color(0xff1e0d00),
      primaryFixedDim: Color(0xffffb870),
      onPrimaryFixedVariant: Color(0xff522d00),
      secondaryFixed: Color(0xffffdcbe),
      onSecondaryFixed: Color(0xff1e0d00),
      secondaryFixedDim: Color(0xfff6bb81),
      onSecondaryFixedVariant: Color(0xff522d00),
      tertiaryFixed: Color(0xffdced4e),
      onTertiaryFixed: Color(0xff101300),
      tertiaryFixedDim: Color(0xffc0d033),
      onTertiaryFixedVariant: Color(0xff343a00),
      surfaceDim: Color(0xff1a120a),
      surfaceBright: Color(0xff42372d),
      surfaceContainerLowest: Color(0xff150d06),
      surfaceContainerLow: Color(0xff231a11),
      surfaceContainer: Color(0xff271e15),
      surfaceContainerHigh: Color(0xff32281f),
      surfaceContainerHighest: Color(0xff3e3329),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffffaf8),
      surfaceTint: Color(0xffffb870),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbe7d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffffaf8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfffbbf84),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffaffc8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc4d537),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      background: Color(0xff1a120a),
      onBackground: Color(0xfff1dfd1),
      surface: Color(0xff1a120a),
      onSurface: Color(0xffffffff),
      surfaceVariant: Color(0xff554434),
      onSurfaceVariant: Color(0xfffffaf8),
      outline: Color(0xffdfc6b1),
      outlineVariant: Color(0xffdfc6b1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dfd1),
      inverseOnSurface: Color(0xff000000),
      inversePrimary: Color(0xff412300),
      primaryFixed: Color(0xffffe2c9),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbe7d),
      onPrimaryFixedVariant: Color(0xff251200),
      secondaryFixed: Color(0xffffe2c9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfffbbf84),
      onSecondaryFixedVariant: Color(0xff251200),
      tertiaryFixed: Color(0xffe0f152),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc4d537),
      onTertiaryFixedVariant: Color(0xff151800),
      surfaceDim: Color(0xff1a120a),
      surfaceBright: Color(0xff42372d),
      surfaceContainerLowest: Color(0xff150d06),
      surfaceContainerLow: Color(0xff231a11),
      surfaceContainer: Color(0xff271e15),
      surfaceContainerHigh: Color(0xff32281f),
      surfaceContainerHighest: Color(0xff3e3329),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerLowest: surfaceContainerLowest,
      surfaceContainerLow: surfaceContainerLow,
      surfaceContainer: surfaceContainer,
      surfaceContainerHigh: surfaceContainerHigh,
      surfaceContainerHighest: surfaceContainerHighest,
      surfaceBright: surfaceBright,
      surfaceDim: surfaceDim,
      surfaceTint: surfaceTint,
      primaryFixed: primaryFixed,
      onPrimaryFixed: onPrimaryFixed,
      primaryFixedDim: primaryFixedDim,
      onPrimaryFixedVariant: onPrimaryFixedVariant,
      secondaryFixed: secondaryFixed,
      onSecondaryFixed: onSecondaryFixed,
      secondaryFixedDim: secondaryFixedDim,
      onSecondaryFixedVariant: onSecondaryFixedVariant,
      tertiaryFixed: tertiaryFixed,
      onTertiaryFixed: onTertiaryFixed,
      tertiaryFixedDim: tertiaryFixedDim,
      onTertiaryFixedVariant: onTertiaryFixedVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
