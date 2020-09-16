# Install Haskell
As a Mac user, I will be explaining how to install on Macs. The process should be similar on Windows.
First, open Terminal (Mac) or Command Prompt (Windows).
Next, copy & paste this line:
` curl -sSL https://get.haskellstack.org/ | sh `

Note: If using a Mac, Xcode developer tools may be need to be installed too.

Once the installation has completed, enter:
` stack exec ghci ` in Terminal.

When this is executed, the GHCi version should be displayed, then "Prelude>" on the next line.

Go to the [Haskell website](https://docs.haskellstack.org/en/stable/README/) for more information.
