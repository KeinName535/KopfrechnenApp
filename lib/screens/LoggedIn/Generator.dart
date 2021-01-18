import 'dart:math';

int Generator_add(int x, int y) {
  var randomizer = Random();
  int sumzahl1 = randomizer.nextInt(20);
  int sumzahl2 = randomizer.nextInt(20);

  int rand = randomizer.nextInt(3);
  if (rand == 0) {
    int erg = (x + sumzahl1) + (y + sumzahl2);
    if (erg == (x + y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 1) {
    int erg = (x - sumzahl1) + (y - sumzahl2);
    if (erg == (x + y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 2) {
    int erg = (x + sumzahl1) - (y + sumzahl2);
    if (erg == (x + y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 3) {
    int erg = (x - sumzahl1) - (y - sumzahl2);
    if (erg == (x + y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else {
    return x;
  }
}

int Generator_sub(int x, int y) {
  var randomizer = Random();
  int sumzahl1 = randomizer.nextInt(20);
  int sumzahl2 = randomizer.nextInt(20);

  int rand = randomizer.nextInt(3);
  if (rand == 0) {
    int erg = (x + sumzahl1) - (y + sumzahl2);
    if (erg == (x - y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 1) {
    int erg = (x - sumzahl1) + (y - sumzahl2);
    if (erg == (x - y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 2) {
    int erg = (x + sumzahl1) - (y + sumzahl2);
    if (erg == (x - y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 3) {
    int erg = (x - sumzahl1) - (y - sumzahl2);
    if (erg == (x - y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else {
    return x;
  }
}

int Generator_mult(int x, int y) {
  var randomizer = Random();
  int sumzahl1 = randomizer.nextInt(20);
  int sumzahl2 = randomizer.nextInt(20);

  int rand = randomizer.nextInt(3);
  if (rand == 0) {
    int erg = (x + sumzahl1) * (y + sumzahl2);
    if (erg == (x * y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 1) {
    int erg = (x - sumzahl1) * (y - sumzahl2);
    if (erg == (x * y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 2) {
    int erg = (x + sumzahl1) * (y + sumzahl2);
    if (erg == (x * y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 3) {
    int erg = (x - sumzahl1) * (y + sumzahl2);
    if (erg == (x * y)) {
      return erg + 3;
    } else {
      return erg;
    }
  } else {
    return x;
  }
}

int Generator_div(int x, int y) {
  var randomizer = Random();
  int sumzahl1 = randomizer.nextInt(20);
  int sumzahl2 = randomizer.nextInt(20);

  int rand = randomizer.nextInt(3);
  if (rand == 0) {
    int erg = ((x + sumzahl1) / (y + sumzahl2)).round();
    if (erg == (x / y).round()) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 1) {
    int erg = ((x - sumzahl1) / (y - sumzahl2)).round();
    if (erg == (x / y).round()) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 2) {
    int erg = ((x - sumzahl1) / (y + sumzahl2)).round();
    if (erg == (x / y).round()) {
      return erg + 3;
    } else {
      return erg;
    }
  } else if (rand == 3) {
    int erg = ((x - sumzahl1) / (y + sumzahl2)).round();
    if (erg == (x / y).round()) {
      return erg + 3;
    } else {
      return erg;
    }
  } else {
    return x;
  }
}
