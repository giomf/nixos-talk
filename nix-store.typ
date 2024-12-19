#import "/globals.typ": *

== Nix store
  The nix store is a directory located at `/nix/store` which forms a directed acyclic graph (DAG)
  and can be queried using the `nix cli` like a graph database.

  - /nix/store -> Graph
  - /nix/store/\* -> immutable nodes
  - Reference to a node forms an edge
 

== Nix store
  /nix/store/#text(fill: green)[wi84ms5hw85w3frljv2spmdl8768dw97]-#text(fill: red)[rustc-1.82.0]

  Each node has a #text(fill: red)[name] and a #text(fill: green)[hash].
  For a given hash, the contents of that path will alway be indentical. Even across machines and plattforms.\

  The files inside this directory can not be modified after its been created!

#utils.fit-to-height(100%)[
  == Nix store
    #figure(
      image("img/nix-store-graph.svg"),
      caption: [Dependencies of rustc-1.82.0],
    )
]
  
#focus-slide[
  Example!\
  ldd.sh
]

  // nix-store --query /nix/store/5d8gysj9z6xaqidxcxjdkckli6kk0vpp-rustc-1.80.1 --references
  // /nix/store/5adwdl39g3k9a2j0qadvirnliv4r7pwd-glibc-2.39-52
  // /nix/store/jfilhsiqdgm4nks2z6labx3iq9qd077a-gcc-13.3.0-lib
  // /nix/store/35mrxhx9vwf3ms734xydxfrh3d84d9fn-llvm-18.1.8-lib
  // /nix/store/4bj2kxdm1462fzcc2i2s4dn33g2angcc-bash-5.2p32
  // /nix/store/5d8gysj9z6xaqidxcxjdkckli6kk0vpp-rustc-1.80.1

  // ```bash
  //   ldd /nix/store/wi84ms5hw85w3frljv2spmdl8768dw97-rustc-1.82.0/bin/rustc
  //   linux-vdso.so.1 (0x00007ffea599d000)
  //   librustc_driver-8fef6321ad5cadb3.so => /nix/store/wi84ms5hw85w3frljv2spmdl8768dw97-rustc-1.82.0/bin/../lib/librustc_driver-8fef6321ad5cadb3.so (0x00007fe9dcaaa000)
  //   libc.so.6 => /nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib/libc.so.6 (0x00007fe9dc8b1000)
  //   libLLVM.so.18.1 => /nix/store/i7laizikxvx5hi86g98k4v3p7g8s2a7s-llvm-18.1.8-lib/lib/libLLVM.so.18.1 (0x00007fe9d3da0000)
  //   libstdc++.so.6 => /nix/store/ybjcla5bhj8g1y84998pn4a2drfxybkv-gcc-13.3.0-lib/lib/libstdc++.so.6 (0x00007fe9d3b3e000)
  //   libgcc_s.so.1 => /nix/store/ybjcla5bhj8g1y84998pn4a2drfxybkv-gcc-13.3.0-lib/lib/libgcc_s.so.1 (0x00007fe9d3b17000)
  //   libm.so.6 => /nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib/libm.so.6 (0x00007fe9d3a30000)
  //   /nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib/ld-linux-x86-64.so.2 => /nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib64/ld-linux-x86-64.so.2 (0x00007fe9e1871000)
  //   libffi.so.8 => /nix/store/lw7psn749bfn2nrn943jdh68hh2im8yl-libffi-3.4.6/lib/libffi.so.8 (0x00007fe9d3a1f000)
  //   librt.so.1 => /nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib/librt.so.1 (0x00007fe9d3a1a000)
  //   libdl.so.2 => /nix/store/wn7v2vhyyyi6clcyn0s9ixvl7d4d87ic-glibc-2.40-36/lib/libdl.so.2 (0x00007fe9d3a13000)
  //   libz.so.1 => /nix/store/bzk3q2l71qwhycsip23y6rl5n881la4n-zlib-1.3.1/lib/libz.so.1 (0x00007fe9d39f5000)
  //   libncursesw.so.6 => /nix/store/1p1j0iv3c909kcs4d5300kcsnlwmbwyj-ncurses-6.4.20221231/lib/libncursesw.so.6 (0x00007fe9d397f000)
  //   libxml2.so.2 => /nix/store/shg1vgcjxghqxhl0sifwgr0g2zg6bbv7-libxml2-2.13.4/lib/libxml2.so.2 (0x00007fe9d3823000)
  // ```
