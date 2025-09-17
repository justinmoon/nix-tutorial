# install nix

option 1: https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#determinate-nix-installer
- this has worked better for me

option 2: https://nix.dev/install-nix.html
- may need to enable flakes etc `experimental-features = nix-command flakes`

# what is nix

- the idea of nix is fantastic. linux and computers should just work this way.
- implementation isn't always great. c++. commies.

every package goes in /nix/store e.g. `zzlrjil82dksjybmb40pnp5zg4bvplda-ropey-1.6.1/``
- `<hash of derivation>-<name>-<version>`

then like a python virtual environment, you get a prifile that hacks your path to make stuff available


```
 ls /etc/profiles/per-user/justin
```

environment-specific installs
```
which nak 
nix shell nixpkgs#nak
which nak
```

can also just run commands
```
nix run nixpkgs#cowsay -- "gm fiatjaf"
```

project-specific installs w/ flakes

```
which zig
nix develop
which zig
zig run hello.zig
``
```
exit
# create .envrc
direnv allow
```
mention fedimint dev env
- similar to what people use docker for
- direnv
- dev, ci, and release build environment is the same

bitcoin core derivation: https://github.com/NixOS/nixpkgs/blob/64c777559b1febab633b0da7826ee666f6ef3c49/pkgs/applications/blockchains/bitcoin/default.nix

my configs
- homebrew replacement
- nice server. make a pr changing login.

benefits
- my configs are my system
- easy to vibe-code in a way that i can control the entropy
- nix used to be hard to do b/c the syntax, but vibing fixes that

takeaways
- i had you install all kind of bs on you system but it's all segregated in /nix/store
