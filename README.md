# Syntactic Analyzer (Workshop 2 LP)

This new stage of the compile process adds support for both the lexical and syntactical analysis.

## Run the code
Test against a custom input changing the contents of `input.in` and then run

```console
$ make
$ ./workshop_2
```

## Some code examples

`getStreaks`: Is the function to get the streaks of a given String. It is expected to print all the streaks.

```
    String example = "aaabbbccc";
    example.getStreaks();
```
And here the expected output should be 'a,b,c'


`addSymbol`: Add a new Symbol to an Alphabet.

```
    Alphabet example;
    example.addSymbol('a');
```
And now Symbol 'a' is part of the alphabet.

