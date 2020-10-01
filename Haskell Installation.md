# Haskell Installation
As a Mac user, I'm going to explain how to install Haskell on MacOS. The process should be similar on Windows.

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
