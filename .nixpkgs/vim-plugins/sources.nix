{ fetchFromGitHub }:
{
  ack = fetchFromGitHub {
    owner  = "mileszs";
    repo   = "ack.vim";
    rev    = "0a7d28bfb130696f73d122cac99d8903e066c896";
    sha256 = "1fhdp90k4dv5vps3fzip0g64haf8j6vp2mpk17w89qg7kyb1bwi6";
  };
  addon-mw-utils = fetchFromGitHub {
    owner  = "MarcWeber";
    repo   = "vim-addon-mw-utils";
    rev    = "0c5612fa31ee434ba055e21c76f456244b3b5109";
    sha256 = "147s1k4n45d3x281vj35l26sv4waxjlpqdn83z3k9n51556h1d45";
  };
  ag = fetchFromGitHub {
    owner  = "rking";
    repo   = "ag.vim";
    rev    = "c478f7973074f15bbf82c298a1678b4e23f1767a";
    sha256 = "002cy365yi8sx5ch30d3zc0fjs9308273s0fi6c108dva4s7qm4f";
  };
  align = fetchFromGitHub {
    owner  = "tsaleh";
    repo   = "vim-align";
    rev    = "fa5fdeeea25269c3e83262c03dfa1ccd27dbd3c9";
    sha256 = "07xr43gvcq00vyc9c1a0i4cij6g8yi0c70plaby897minszrlsmm";
  };
  alternate = fetchFromGitHub {
    owner  = "vim-scripts";
    repo   = "a.vim";
    rev    = "2cbe946206ec622d9d8cf2c99317f204c4d41885";
    sha256 = "0h62v9z5bh9xmaq22pqdb3z79i84a5rknqm68mjpy7nq7s3q42fa";
  };
  autotag = fetchFromGitHub {
    owner  = "vim-scripts";
    repo   = "AutoTag";
    rev    = "ef0a37e8da77cd6c40d97a8e7a60c33ddc39d6ba";
    sha256 = "0simja15lw0i2jlgfcdf5avnjjki7cg75mrqak84sm6kc3rnjzll";
  };
  base16 = fetchFromGitHub {
    owner  = "chriskempson";
    repo   = "base16-vim";
    rev    = "e711e9b1412b55fec7e8a5cff4ac5c06f9078729";
    sha256 = "1ngmr8qqribpsivrn0b95an4lzlv7if32y0bj5zz9w49bz470xsj";
  };
  bundler = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-bundler";
    rev    = "b42217a20cd4cac5a00096dc4e98d2497c21b3fe";
    sha256 = "1ir1l4qihz5pd47anzbpiwjdvm1s0yxh69zafa03cad0k3bvb3xl";
  };
  capnp = fetchFromGitHub {
    owner  = "cstrahan";
    repo   = "vim-capnp";
    rev    = "98fcb039b97dbc978a964e36f2681e926b72524d";
    sha256 = "1mpccza18k8469jxf6m7599skar49rzizd829jqlalvcnn2m2n2j";
  };
  coffeescript = fetchFromGitHub {
    owner  = "AndrewRadev";
    repo   = "vim-coffee-script";
    rev    = "d43fdec03ec1a76e36d0bf496ebce545c6d64f3c";
    sha256 = "17zbbllwdfxmbd07pb6b0zmqvsqs7anw3csfvbpb1nbx26vqkgjq";
  };
  command-t = fetchFromGitHub {
    owner  = "wincent";
    repo   = "Command-T";
    rev    = "f7344ebbe95c532b2ad01f19877d6d611db0193b";
    sha256 = "0s704v9dv8mn5w87giw1246l5vgrbi34bbj2gydr6nikajhw4fyl";
  };
  ctrlp = fetchFromGitHub {
    owner  = "kien";
    repo   = "ctrlp.vim";
    rev    = "b5d3fe66a58a13d2ff8b6391f4387608496a030f";
    sha256 = "17p0v54x46jm19kri2i7n4pfwh35s84dr0zvgqxz0gsqx93kpdmq";
  };
  cucumber = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-cucumber";
    rev    = "9b49b42b331c196ad5a10483bb61b2a651b91d2e";
    sha256 = "06jvblqbyvhk3jhf1s8dd3zs9kmy2yamxk4dymh0m4rf779rzqp4";
  };
  dispatch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-dispatch";
    rev    = "69fea418692f76058d5cd95f0a17ed6b0f5bbb77";
    sha256 = "1nc3ajfna1ajxz2d9706bynfm2pvk6q3rw9fyi80w7s54q8af2dk";
  };
  dockerfile = fetchFromGitHub {
    owner  = "ekalinin";
    repo   = "Dockerfile.vim";
    rev    = "edb7814a98789afabebefb75ba00550021a21b5c";
    sha256 = "10pha879jxn9r6slbbcakd4z7x5syjyyd34lhzs7whvc72adjs23";
  };
  eclim = fetchFromGitHub {
    owner  = "cstrahan";
    repo   = "vim-eclim";
    rev    = "71ffa38893d8453dd66b76724c52def0b132a9cb";
    sha256 = "0a4wpzgc7gp1mbflwgbgcdvnfndfb2ajl79lpfcshbhcymdl02w8";
  };
  elixer = fetchFromGitHub {
    owner  = "elixir-lang";
    repo   = "vim-elixir";
    rev    = "f2c747da5edd92c8430b9f1fdfe117467cf1551e";
    sha256 = "1x4chlgfvhn4l6p7zwmmx9f31g03yykar9lfrk66lxff4ix4p8d6";
  };
  elixer-snippets = fetchFromGitHub {
    owner  = "carlosgaldino";
    repo   = "elixir-snippets";
    rev    = "1bc7619f9cb87ab8472ce32437b4cb00888581c8";
    sha256 = "1gk3va0q2garq363ki8bq17xwd476q9mk9wvhsx32m8wkvy4yxaj";
  };
  endwise = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-endwise";
    rev    = "f06abe3d6eca6f6ebfc31ea3163a51575f450df6";
    sha256 = "0zib0gym8srpjwrphfh05q8xs1nmmxqk3f6sr2x80bp3wil47h72";
  };
  eunuch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-eunuch";
    rev    = "eb8b2d54fb537ee93f762f6331265057a3f69727";
    sha256 = "1jr8pl7gz5ixvb62p6134636896ja8zv4wyh26n6gclk0b60h1af";
  };
  fugitive = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fugitive";
    rev    = "dba8a0705d95cda76d599bb7d09964d67741a5c5";
    sha256 = "1gy62q6gi80y7qpqg4vwgj6a1lry6r1zf2kg2i1nlbh3bph00yij";
  };
  ghcmod = fetchFromGitHub {
    owner  = "eagletmt";
    repo   = "ghcmod-vim";
    rev    = "3e012a5b0b904c5c32eeea39071534d492a64a0f";
    sha256 = "15jx1v5wq3jajja1k6p32jy3yh52d64ygzhybzmxw6269vw3bygl";
  };
  haml = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-haml";
    rev    = "5c1189022d217219be6f607e653bb5ad8c2ff6ca";
    sha256 = "1jd19xlxrp5kiidrw7fz7cr7cjxw34vv1jgfnyzcsirrblxbyp6r";
  };
  handlebars = fetchFromGitHub {
    owner  = "nono";
    repo   = "vim-handlebars";
    rev    = "1eeeff8ade7b5008e7a213cc7eb9c7e1bed52bef";
    sha256 = "085l3vhb4pzdw24dykr1glykrgyyhsxyb56w323iv21zmk4y46np";
  };
  haskell-vim = fetchFromGitHub {
    owner  = "neovimhaskell";
    repo   = "haskell-vim";
    rev    = "6bb3716a41796f27321ee565b8bb36806b9f7b38";
    sha256 = "0rkhbzxb17rhxw9g7s47grnl10kxijph7x1b8b6ilzyzbnxaf3s5";
  };
  headerguard = fetchFromGitHub {
    owner  = "vim-scripts";
    repo   = "headerguard.vim";
    rev    = "f3ca7bf7476258af69fd67b6c209b136093241b3";
    sha256 = "0350slaxbmgr35ngwgwh3zb3x047h1ka1crx1w25r3fpar6z3ybj";
  };
  html-template-syntax = fetchFromGitHub {
    owner  = "pbrisbin";
    repo   = "vim-syntax-shakespeare";
    rev    = "b66362067322176f1e1199b40b9d9fbb25e71074";
    sha256 = "06xphrmv2sx67cz24ms54i4g1zciww892ziyy0ngnfwanvvrl4aj";
  };
  html5 = fetchFromGitHub {
    owner  = "othree";
    repo   = "html5.vim";
    rev    = "ad38231df6845562f569512fd250c5660aadeb64";
    sha256 = "1b24x30iag0daag1r3gnjbys7mpsx3dzj7ywhxlg0a2h2fg5jmw8";
  };
  hybrid = fetchFromGitHub {
    owner  = "w0ng";
    repo   = "vim-hybrid";
    rev    = "37a2d17c8d7b6cfe5288ef01b9b574828420de62";
    sha256 = "184xs9c57vxr6jyawkgx4vj3w4fl7kzvfqw4z3ksn5hc4kic7jgd";
  };
  idris-vim = fetchFromGitHub {
    owner  = "idris-hackers";
    repo   = "idris-vim";
    rev    = "45680a3c412f2cc8d40aff512e5e9ace44002922";
    sha256 = "1canjsklfi9w3v9gvvswb8dawfvdz4dgmib5wads8a22n5ya6lz0";
  };
  jasmine = fetchFromGitHub {
    owner  = "claco";
    repo   = "jasmine.vim";
    rev    = "50cae137f8308cdfdf70010232a852a364549411";
    sha256 = "13b33ils3807xpzpklwxdcb9w00q8rcbrcb9fff8c8qzmaan1gya";
  };
  jellybeans = fetchFromGitHub {
    owner  = "nanotech";
    repo   = "jellybeans.vim";
    rev    = "f931895c20681684278aef2ffd810730b9c36ec3";
    sha256 = "099i60qn860gwgahjz1qhmic4340m0fb5prppyw18kzxz37lkp92";
  };
  jellyx = fetchFromGitHub {
    owner  = "guns";
    repo   = "jellyx.vim";
    rev    = "62f41762adadc28059f524ce0e7aed6092c544b5";
    sha256 = "0mc618is4ahs9ypcvgpxy7vn83m43fljkim9vv9xbg319zlv76qw";
  };
  latex-box = fetchFromGitHub {
    owner  = "LaTeX-Box-Team";
    repo   = "LaTeX-Box";
    rev    = "3c2901e12cb78bfb2be58ba4c62a488612550fe1";
    sha256 = "1z4mdy47cpwcdhvy8mr72vhlybxn1y59yd3ixf6ids1bzpkrd7zl";
  };
  less = fetchFromGitHub {
    owner  = "groenewege";
    repo   = "vim-less";
    rev    = "6fae407f7ed666a6dd0fb596e67df8787dccca59";
    sha256 = "0sf16q8j0v6qssxhrs7bznljhqbyayq2h359a1nwjlyxr68p5lbk";
  };
  liquid = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-liquid";
    rev    = "ff85972ccf3706bba0e2856108ccd972a2d55e2a";
    sha256 = "0c9yv05y566isah46i7v2ldvd4kq9nv80n71a0flsdy5cjgdr02z";
  };
  markdown = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-markdown";
    rev    = "15d19778a3be4ab3f949cba636d53a87e2c03f29";
    sha256 = "1j89327yxapsm0sd54h83142znmzr7hz4xk30fi793478kyb47mh";
  };
  matchit = fetchFromGitHub {
    owner  = "edsono";
    repo   = "vim-matchit";
    rev    = "ceaf496a3763f3c20bc7f50c2135df4f1775ae05";
    sha256 = "0r5bfl86x0il9558n2svq7mr8pl2xqbvy8plvgbb1b8q8v9cdz42";
  };
  matchtag = fetchFromGitHub {
    owner  = "gregsexton";
    repo   = "MatchTag";
    rev    = "6dfdab1530d47b77a1839b9477f27c33a2f10b26";
    sha256 = "1z7l7fg23vhcip15mrirghlqvi0cdac615y176w1x7ll4gaa7di1";
  };
  minitest = fetchFromGitHub {
    owner  = "sunaku";
    repo   = "vim-ruby-minitest";
    rev    = "1a359246c1da5d738130e136aac5a1c7ce022ecb";
    sha256 = "1bpc9d6zsn92hsrkwbd7zbjnksj5f2jvbypx28mj9c4iq2w7ncx7";
  };
  mustache = fetchFromGitHub {
    owner  = "juvenn";
    repo   = "mustache.vim";
    rev    = "0c3900b42a81ec79885cf984ad33b2280697c7c9";
    sha256 = "02l4mrswj6r2s3mpw9fg6giqds23643j17wddk1qs94qc9c89ac6";
  };
  neco-ghc = fetchFromGitHub {
    owner  = "eagletmt";
    repo   = "neco-ghc";
    rev    = "597e8ebf25160b86ee9c865779d39df7a82047c0";
    sha256 = "16db7zv4pzg5dc68gxqn8zg2b13gbr39l03znp47pqs3czgkf1z5";
  };
  nerdcommenter = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdcommenter";
    rev    = "5cc672a4f2adb734ac671499476034f0cd1d3d72";
    sha256 = "15qqbsrbfwk0b1hrn2ylphc3mw3azh33mks0bb5nmxwimfvyfdlr";
  };
  nerdtree = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdtree";
    rev    = "0b44415a3302030b56755cc1135ca9ca57dc1ada";
    sha256 = "164w31h8ra6wmma9h3b2qbds12wg8gvqkbq9qy3gznxbmand7q0m";
  };
  nginx-vim-syntax = fetchFromGitHub {
    owner  = "evanmiller";
    repo   = "nginx-vim-syntax";
    rev    = "8dffab7043185482414ac9c4d7041e26d77cb898";
    sha256 = "0gyi123z6k9j66k3bixrp05d9vp5ad4ydk1xlsjdgl7riw17ig7i";
  };
  nimrod = fetchFromGitHub {
    owner  = "zah";
    repo   = "nimrod.vim";
    rev    = "597cca20eb31dc55cd285f108b37ff5ca6256a69";
    sha256 = "0gykf8crmv5y1dqf43q04lsf5fs2xfp1fjcy17933j0w8agyazpx";
  };
  nodejs = fetchFromGitHub {
    owner  = "mmalecki";
    repo   = "vim-node.js";
    rev    = "f25152daaf640a60221c918713ae29e870b28581";
    sha256 = "037j6lddzkpc1c38fya0l6crcki2hpnvicyn9p0whb21yb0fi1vb";
  };
  pathogen = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-pathogen";
    rev    = "b4174e4d1a16e7f0c5c6dfca923269a20a9f50c2";
    sha256 = "0gn6pdhs3nmxhlqx6jxs8vaxfjwz26z4ifpv2hykvc6d48q1sfkh";
  };
  puppet = fetchFromGitHub {
    owner  = "ajf";
    repo   = "puppet-vim";
    rev    = "eccd0e9e1e93acd92e4fd9a67ad07d8737ab4b47";
    sha256 = "0gsfx6f04x0b6vyl7g8lraxc6ilzn2h1l56aqcbs8s5fnqs2lsn1";
  };
  purescript-vim = fetchFromGitHub {
    owner  = "raichoo";
    repo   = "purescript-vim";
    rev    = "7a59982e43a31d8abbe6c6b9d837f01585207ffd";
    sha256 = "0a74gwd9jk0v2vfbxk1priqi6zwaqpncf4x5zzwa05lfh9ylizk7";
  };
  rails = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rails";
    rev    = "2c5c72aaf9711e53e4d54fbf8aee011e8e25ac82";
    sha256 = "0pk4apd1gcixks769d65x9drpfvh9p3wqrr011pjbhh5rqk7np8y";
  };
  rake = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rake";
    rev    = "82ad45543f0d13dfa7d3f59ca4cd54d0e145417f";
    sha256 = "0cqh0qj83mxakx4066d5z6p1wl28mm2kb1nn0iallkysz8f161nm";
  };
  rspec = fetchFromGitHub {
    owner  = "thoughtbot";
    repo   = "vim-rspec";
    rev    = "2cf8c5002cb89eb8e9aabe59d25b89dc5afec88a";
    sha256 = "1lp0jk4h5nda6hk8z7zl30pvdrx435ckxvx3b85m1fjig2axx7mb";
  };
  rust = fetchFromGitHub {
    owner  = "wting";
    repo   = "rust.vim";
    rev    = "2450ecf3091cc7c2711ca9f00eae8e3bedd04376";
    sha256 = "0n34xxyjkqmgii4k7iww6vpfkx2rx94mn8r9g9axpg3fp6969s1v";
  };
  scala = fetchFromGitHub {
    owner  = "derekwyatt";
    repo   = "vim-scala";
    rev    = "71ada50fc5e2b3c9fdbdb75835a218d2c245efec";
    sha256 = "0k3s7bb4xx6w22k9z2fsgqhfqvph0awc88iwl3qyk5i8zc5qkd6w";
  };
  scratch = fetchFromGitHub {
    owner  = "vim-scripts";
    repo   = "scratch.vim";
    rev    = "90c2bc4bfe01151aa5c71d9cb243b05bc105ae01";
    sha256 = "1wxks5s5z0r4imj6wq3bqgc0rhw39jg2x2wqfmlij31gknppd93k";
  };
  scss = fetchFromGitHub {
    owner  = "cakebaker";
    repo   = "scss-syntax.vim";
    rev    = "35f47ff7473939fdfcf7ba9ce36f0d8fb4bd4142";
    sha256 = "0d80yhlnqhrlfxz7yq025kfknpwawdb8xm5kb6djxdsg18hqlnb1";
  };
  sinatra = fetchFromGitHub {
    owner  = "hallison";
    repo   = "vim-ruby-sinatra";
    rev    = "b95547efa54a5eb21d483ea3de9cfc817fc56170";
    sha256 = "17pqfs3xqxvn5n0lfh8mvz2k1zk2khspnjkvkzrx2lbing9b75cv";
  };
  slim = fetchFromGitHub {
    owner  = "slim-template";
    repo   = "vim-slim";
    rev    = "0daaa8581f9a9968cebbc7d14ae9acf1625c0389";
    sha256 = "0p1c1mk6ngvacq13azq0l7m1r6g5qxq5jln08nbyyq12di2h5pz7";
  };
  solarized = fetchFromGitHub {
    owner  = "altercation";
    repo   = "vim-colors-solarized";
    rev    = "528a59f26d12278698bb946f8fb82a63711eec21";
    sha256 = "05d3lmd1shyagvr3jygqghxd3k8a4vp32723fvxdm57fdrlyzcm1";
  };
  surround = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-surround";
    rev    = "2d05440ad23f97a7874ebd9b5de3a0e65d25d85c";
    sha256 = "1b74l52a2yi9r5j6w3mcyhacdxajs3ndab1viw632nprqqsh8qb4";
  };
  switch = fetchFromGitHub {
    owner  = "AndrewRadev";
    repo   = "switch.vim";
    rev    = "544cdeaf291d9cb54c61bd8bbee4e2c7cfcd74bb";
    sha256 = "06fhyd8wb3nqc6dgyycgfmccnh030y4gnxih1x8ia4009f1nqrkb";
  };
  syntastic = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "syntastic";
    rev    = "e484ac941657b8ee6dbcb6f3c0279e3c1f895fb5";
    sha256 = "1cnmrrcmr27pwjqsbwjcjbaknlv4zvw91mizl7asn08a2n4633mf";
  };
  tabmerge = fetchFromGitHub {
    owner  = "vim-scripts";
    repo   = "tabmerge";
    rev    = "074e5f06f26e7108a0570071a0f938a821768c06";
    sha256 = "0prkyza1n49cdaslcr57w8zv15vw78mlqbzib2xipmawzjq02idq";
  };
  tabular = fetchFromGitHub {
    owner  = "godlygeek";
    repo   = "tabular";
    rev    = "60f25648814f0695eeb6c1040d97adca93c4e0bb";
    sha256 = "0jsq614k1s4adsyhjzsbb86ddl4mlv0fvxc5imf0pqikimpv9spr";
  };
  textile = fetchFromGitHub {
    owner  = "timcharper";
    repo   = "textile.vim";
    rev    = "00541bdac375938ca013fdb39eab95a04e622bac";
    sha256 = "00xwa8vwmakvzawsg1brymkhgd395ls1pvh9hrrpiiq7lly1zdl7";
  };
  tlib = fetchFromGitHub {
    owner  = "tomtom";
    repo   = "tlib_vim";
    rev    = "d76dd24f51f55c2eb45df4f4ffa5240b315fa235";
    sha256 = "0x0y1dijklbd33q3il4m6pwg82mmlxkl3a7x1hg2ljqfgygjdlyz";
  };
  tomorrow-night = fetchFromGitHub {
    owner  = "chriskempson";
    repo   = "vim-tomorrow-theme";
    rev    = "f45a2ca260d825b6aee72621f8f6158d815ac472";
    sha256 = "1dvjlbg6pjqwr2cnqghdikkhiyf84lyxnkswl2dq1s1mi9d5lj2z";
  };
  ultisnips = fetchFromGitHub {
    owner  = "SirVer";
    repo   = "ultisnips";
    rev    = "1ce44ac9c8731645070aea5e7c41521b3d95e1b3";
    sha256 = "02ccaj1q3m944cr1ii0xvg63svy32ifgiwdw8ziz95bf4npjxk8p";
  };
  unimpaired = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-unimpaired";
    rev    = "23f471ad0f00e2fab097f9d67ffd770881d4b35a";
    sha256 = "1z99cxs57kw7d4ms9pzbiwyfla5h49qs6iidv8f20cgparggqsgq";
  };
  vim-classpath = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-classpath";
    rev    = "1ef18a10512fe0f84bb2c412b38e613c331a7b55";
    sha256 = "14icpi4df4pvdx9wam75cdfr0k7sdc7n7aypx2jgs8x1dv88cq4x";
  };
  vim-clojure-static = fetchFromGitHub {
    owner  = "guns";
    repo   = "vim-clojure-static";
    rev    = "f1c53e290b16885c2eb3fc96e57d9984b627f735";
    sha256 = "00894g8fxpj8xx7kl3n3654h45snp21281qgwgwdr3ccvlgabx19";
  };
  vim-css-color = fetchFromGitHub {
    owner  = "ap";
    repo   = "vim-css-color";
    rev    = "7ad79c7b77bd83296d7a10e596860d9269070207";
    sha256 = "08mnjkjc6fjghwijj8mxabm95dps9yxlvkyv6wm0mnlj18hqmdc3";
  };
  vim-exchange = fetchFromGitHub {
    owner  = "tommcdo";
    repo   = "vim-exchange";
    rev    = "9373a8471cd968e5e4605c3487f80c9364d412b2";
    sha256 = "0y5afr3a9jdyhh3pm6in017hg7rsv7driqsyn9ipgy0jnw4wpn0y";
  };
  vim-fireplace = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fireplace";
    rev    = "8579a41a186702e20bb25e21ebaa5a3a1b9c265a";
    sha256 = "06ssc59xqwzsxqb758d038hkgxcrvsmcqs38gz1cnaf282jwcx3a";
  };
  vim-git = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-git";
    rev    = "37fd7c5756aaf707e2f02cbf50d5e7d8418c28a1";
    sha256 = "0qfc0sn540h0hjfh1lwdg4al8ls1s75fl7g81d6jgkbkjrx62hp0";
  };
  vim-go = fetchFromGitHub {
    owner  = "fatih";
    repo   = "vim-go";
    rev    = "8f11f67bc8383f010f7cf8bd6490fdbeaa444f4e";
    sha256 = "0wy0319sa41gg12id26ld93i2561gzx79mabl27biyf66srycnhs";
  };
  vim-hdevtools = fetchFromGitHub {
    owner  = "bitc";
    repo   = "vim-hdevtools";
    rev    = "474947c52ff9c93dd36f3c49de90bd9a78f0baa1";
    sha256 = "1wwjb9m2l9q75d408jzq9bwv5i376bfgs6vc3ihwwlawcrmhjpxz";
  };
  vim-indent-object = fetchFromGitHub {
    owner  = "michaeljsmith";
    repo   = "vim-indent-object";
    rev    = "1d3e4aac0117d57c3e1aaaa7e5a99f1d7553e01b";
    sha256 = "1xxl5pwbz56qjfxw6l686m1qc4a3q0r7afa9r5gjhgd1jy67z7d7";
  };
  vim-indexed-search = fetchFromGitHub {
    owner  = "henrik";
    repo   = "vim-indexed-search";
    rev    = "86533d7c630563a4f606da8a60651e6da8978090";
    sha256 = "1nxhrpk880k841rp52r9qpbich1ddi9p9wr4367f9nn9paw361vd";
  };
  vim-ls = fetchFromGitHub {
    owner  = "gkz";
    repo   = "vim-ls";
    rev    = "795568338ecdc5d8059db2eb84c7f0de3388bae3";
    sha256 = "0p3dbwfsqhhzh7icsiaa7j09zp5r8j7xrcaw6gjxcxqlhv86jaa1";
  };
  vim-mkdir = fetchFromGitHub {
    owner  = "pbrisbin";
    repo   = "vim-mkdir";
    rev    = "549dcb4b6802c213fd7c4f0b4d76022c9875b786";
    sha256 = "0blh09ccrsc1sfav2rl987kbyaj7qjxry5nw1skibhidrb77sxmh";
  };
  vim-ragtag = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-ragtag";
    rev    = "0ef3f6a5778467fbca12b7874a4509593b209228";
    sha256 = "1j2y813ba84gvgwbradxg9qqp6za07va8z6z7az85g1kh3j9pln8";
  };
  vim-redl = fetchFromGitHub {
    owner  = "dgrnbrg";
    repo   = "vim-redl";
    rev    = "98382630e191f22ea8df8b85cf04f48e687d8cfb";
    sha256 = "0p62gzvwiqm5jxqic91f1lj1frp84x8558bv0mc638vhxhdi3mqa";
  };
  vim-repeat = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-repeat";
    rev    = "7a6675f092842c8f81e71d5345bd7cdbf3759415";
    sha256 = "0p8g5y3vyl1765lj1r8jpc06l465f9bagivq6k8ndajbg049brl7";
  };
  vim-rsi = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rsi";
    rev    = "dfc5288097b83d1eb3173d8be348a11f3d467d8e";
    sha256 = "1m2v7j72q73x3rvqs8yhy3rw2y24avbf4cvxn1bhqi24mqx41kkr";
  };
  vim-ruby = fetchFromGitHub {
    owner  = "vim-ruby";
    repo   = "vim-ruby";
    rev    = "880f17452ce1ef2158d893b11016fb39b7812fc3";
    sha256 = "0z2p2v421xdcxjszxgd4gi4gjafn1q2a2rwzaclawysl4alrdvif";
  };
  vim-sexp = fetchFromGitHub {
    owner  = "guns";
    repo   = "vim-sexp";
    rev    = "b4398689f7483b01684044ab6b55bf369744c9b3";
    sha256 = "16j929qqf4axnfna27f8cj7r11j4pv1qivw126sjbxfhamk32xx5";
  };
  vim-sexp-mappings-for-regular-people = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-sexp-mappings-for-regular-people";
    rev    = "f5b66e73c81a3b4c0c8f5a8141fb09a5a213f711";
    sha256 = "1kf3bkv9wppxgifybd972avdd2563ra2387n7qc6q72b2r9mx5aa";
  };
  vim-snippets = fetchFromGitHub {
    owner  = "honza";
    repo   = "vim-snippets";
    rev    = "15387bd29f4bebbb133356b127e551694325e36c";
    sha256 = "1kc07mj2wn29ii67qnbyb3xw7m2z4ic7mavjlglgwlag66bmkzhf";
  };
  vim-vroom = fetchFromGitHub {
    owner  = "skalnik";
    repo   = "vim-vroom";
    rev    = "e8c0264fa72923142a2895a579452e2f947fe5e5";
    sha256 = "0300aa29z0c9ixqyhljw8ddflsz8aw5h503ld9m27476hpmvqd2j";
  };
  vimerl = fetchFromGitHub {
    owner  = "jimenezrick";
    repo   = "vimerl";
    rev    = "536f7e265449b2609d217da4193f2e4060e6b728";
    sha256 = "1bsi4dd9zbnfr9zz0270rp4iplkpmrjinal775bj9clxrkvdcrj3";
  };
  vimproc = fetchFromGitHub {
    owner  = "Shougo";
    repo   = "vimproc.vim";
    rev    = "c40f7e77e6ff0586ff6951e7cf479b3dc81bb69d";
    sha256 = "01jqx3ljqxbwhgnbn47igcnpxpm8dkw2ndxcn6d7h5y627xwwq6y";
  };
  vimwiki = fetchFromGitHub {
    owner  = "vimwiki";
    repo   = "vimwiki";
    rev    = "2c03d82a0e4662adf1e347487d73a9bf4bf6fdac";
    sha256 = "1pqcb9087b4nr848s3clkgmp3y8nqvwq40rp2jqp0dxf0h9gx54g";
  };
  vinarise = fetchFromGitHub {
    owner  = "Shougo";
    repo   = "vinarise.vim";
    rev    = "b0425e829c0a12cd49a923130e1896bbca7ea2b8";
    sha256 = "06xvbhqxaxrq1l2y7py6p28alnvq169m6552hc6xzdd8ky7l6hmh";
  };
  vitality = fetchFromGitHub {
    owner  = "aaronjensen";
    repo   = "vitality.vim";
    rev    = "807c54086d321c86b70f8b8d0a9af07e0411e808";
    sha256 = "14z7llq4ys1j5n2r5hpwnlddjkan2s44ri08r3wp8rvdqmf64y4p";
  };
  voom = fetchFromGitHub {
    owner  = "vim-scripts";
    repo   = "VOoM";
    rev    = "a88734fd3e3aa5ce43d65cdfd6d81fa73bf49757";
    sha256 = "17va2iwxh9bcd8dy7j8dq30gc32az3jz8m4f38la794sb7z6qyyq";
  };
  xoria256 = fetchFromGitHub {
    owner  = "vim-scripts";
    repo   = "xoria256.vim";
    rev    = "ae38fd50b365052ed4ddbc79a006a45628d5786a";
    sha256 = "1i3j176l821sq55v2rpwnyipmydr3v4y7a9xnrvn0807cxi1bb68";
  };
}