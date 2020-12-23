# BNFC Installation

Please install [Haskell](Haskell-Installation.md) before proceeding to install BNFC.

The [BNFC website](https://bnfc.digitalgrammars.com/) has installation information. There is also a [tutorial](https://bnfc.digitalgrammars.com/tutorial/bnfc-tutorial.html) on calling BNFC and explains the different files that are created with examples.

## macOS/Linux

First, install [Homebrew](https://brew.sh/) in Terminal by running:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

After Homebrew has successfully installed, run
`brew install bnfc`

To verify that bnfc was installed, run `bnfc --version` and it should return `2.8.3` (or a larger number if it's a newer version).

While cabal is usually installed with Haskell, I also had to run `brew install cabal`

To verify that cabal was installed, run
`cabal --version` and it should return
```
cabal-install version 3.2.0.0
compiled using version 3.2.0.0 of the Cabal library
```

Next, install ghcup by running
`curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh`

Then, install alex (lexer generator) and happy (parser generator) by running
```
cabal install alex
cabal install happy
```

To verify that these were installed, running
`alex` and `happy` should return usage information for each of them.

If either of the commands aren't found, try changing the Terminal shell by clicking Terminal -> Preferences (cmd+,). In the General tab for 'Shells open with:' select 'Command (complete path)' and enter `/bin/zsh`.
Close the Terminal and reopen, then check that the shell has been changed to zsh on the top where it lists the your home directory (assuming that is your default profile when opening new windows).
It should say `username@user-MBP ~ % ` on the command line.

Originally, I used the bash shell and received errors that the commands weren't found, but after I switched to the zsh shell, everything worked for me.

Now that everything is installed, you should be able to run and test BNFC.

## Run & Test BNFC
Download the Calculators folder or copy the BNFC grammar from the [tutorial](https://bnfc.digitalgrammars.com/tutorial/bnfc-tutorial.html) in the section "My first compiler: calculator" and name it calc.cf

cd into the folder where the `calc.cf` file is and run
`bnfc -m -haskell numbers.cf` This command should return
```
8 rules accepted

Use Alex 3.0 to compile LexCalc.x.
writing new file ./AbsCalc.hs
writing new file ./PrintCalc.hs
writing new file ./LexCalc.x
writing new file ./ParCalc.y
writing new file ./TestCalc.hs
writing new file ./ErrM.hs
writing new file ./SkelCalc.hs
writing new file ./DocCalc.txt
writing new file ./Makefile
```

To compile all the files to generate the parser, run
`make`
and this should return
```
alex --ghc LexCalc.x
happy --ghc --coerce --array --info ParCalc.y
Grammar info written to: ParCalc.info
ghc --make TestCalc.hs -o TestCalc
[1 of 7] Compiling AbsCalc          ( AbsCalc.hs, AbsCalc.o )
[2 of 7] Compiling ErrM             ( ErrM.hs, ErrM.o )
[3 of 7] Compiling LexCalc          ( LexCalc.hs, LexCalc.o )
[4 of 7] Compiling ParCalc          ( ParCalc.hs, ParCalc.o )
[5 of 7] Compiling PrintCalc        ( PrintCalc.hs, PrintCalc.o )
[6 of 7] Compiling SkelCalc         ( SkelCalc.hs, SkelCalc.o )
[7 of 7] Compiling Main             ( TestCalc.hs, TestCalc.o )
Linking TestCalc ...
```

Next, run
`echo "1+2*3" | ./TestCalc`
where `TestCalc` is the parser and should return an abstract syntax tree:
```
Parse Successful!

[Abstract Syntax]

EAdd (EInt 1) (EMul (EInt 2) (EInt 3))

[Linearized tree]

1 + 2 * 3
```

#### References
- [BNFC website](https://bnfc.digitalgrammars.com/)
- [BNFC tutorial](https://bnfc.digitalgrammars.com/tutorial/bnfc-tutorial.html)
