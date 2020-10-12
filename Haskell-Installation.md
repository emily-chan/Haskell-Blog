# Haskell Installation
As a Mac user, I'm going to explain how to install Haskell on macOS. The process should be similar on Windows.

First, open Terminal (Mac) or Command Prompt (Windows).

Next, copy & paste this line:  
` curl -sSL https://get.haskellstack.org/ | sh `

Note: If using a Mac (and depending on the macOS your computer is running on), Xcode developer tools may be need to be installed too.

If so, run ` xcode-select --install `. There may be additional commands to run, but you should be prompted to enter those.

Once the installation has completed, enter:  
` stack exec ghci ` in Terminal.

When this is executed, the GHCi version should be displayed, then "Prelude>" on the next line. This means it is ready to use, whether it's directly in the console or from running a file.

Go to the [The Haskell Tool Stack](https://docs.haskellstack.org/en/stable/README/) for more information.

[Install/upgrade](https://docs.haskellstack.org/en/stable/install_and_upgrade/) also explains the installation process in more detail.

## Tips
After entering `ghci` or `stack exec ghci` (depends on installation version), enter `:load filename.hs` to load a module (Haskell file) and `:reload` to reload it after making changes. Then you should receive a message indicating which modules were loaded.

View information about a specific type such as Num, by entering `:info Num`, which outputs the following:
```
Prelude> :info Num
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
  	-- Defined in ‘GHC.Num’
instance Num Word -- Defined in ‘GHC.Num’
instance Num Integer -- Defined in ‘GHC.Num’
instance Num Int -- Defined in ‘GHC.Num’
instance Num Float -- Defined in ‘GHC.Float’
instance Num Double -- Defined in ‘GHC.Float’
```

For more information about a certain built-in function like min, enter `:type min`:
```
Prelude> :type min
min :: Ord a => a -> a -> a
```

To exit GHCi, enter `:quit` and you should receive a message `Leaving GHCi.`

A useful shortcut for these are `:l`, `:r`, `:i`, `:t`, `:q` instead of typing out the whole word.

#### References
- https://hackmd.io/@alexhkurz/Hk86XnCzD
- https://docs.haskellstack.org/en/stable/README/
