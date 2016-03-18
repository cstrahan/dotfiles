{ fetchFromGitHub }:
{
  ack = fetchFromGitHub {
    owner  = "mileszs";
    repo   = "ack.vim";
    rev    = "b9ceb0f9eec504e18b67f43ab9c6ba2bd5b80c2d";
    sha256 = "1hcjlljapkhwww40hjiqa6hf56kiga5kcli33i3g4n14i866mwlz";
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
    rev    = "994c27dd8f237573208548e7480e39b24ccbbfba";
    sha256 = "1iwadpym1b7p8jsn18s8jwysnwf3nqlndwhaxk8vaiwb3iklmrah";
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
    rev    = "2d80b2e65cd690dd17c66fb52e5f9fb09700b1e7";
    sha256 = "0l5ryqn2i19x20y0i2rafgihcq3ic8g1wgjyzpflsiw68d676lcp";
  };
  ctrlp = fetchFromGitHub {
    owner  = "kien";
    repo   = "ctrlp.vim";
    rev    = "564176f01d7f3f7f8ab452ff4e1f5314de7b0981";
    sha256 = "1nzzii9g4ckf561csrg7nclnsb6gr5lgghmlhdsxabkcp2lkhnmr";
  };
  cucumber = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-cucumber";
    rev    = "bcb119cf9a6e131d5c9cbb7af3296eb6f2c23151";
    sha256 = "1hljngnk6qpblcwgvhrfpmgc7as6gq7x89l5q62rky4rr53zb2gz";
  };
  dispatch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-dispatch";
    rev    = "eb3e564fb1edfee09fe6aeb57f3388e273da72c8";
    sha256 = "14wpjahmw8f5fz3fgzc5h2ji5smpa9kig5iwkycmj6y02ypb8fza";
  };
  dockerfile = fetchFromGitHub {
    owner  = "ekalinin";
    repo   = "Dockerfile.vim";
    rev    = "ff79ae2dfa06ead24c0a32af269c9038acde144c";
    sha256 = "06pyf3ya2qbbrfprr9nlbms8p4iawrq1i8za0dh98jdbrla2xkbb";
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
    rev    = "1cfd5ab992b61bc30041950641eb577066269ee5";
    sha256 = "18vifhw1jw2wfcykl3qj61v7z08a1hsshcy9dzjlbcac9iyv154d";
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
    rev    = "0067ceda37725d01b7bd5bf249d63b1b5d4e2ab4";
    sha256 = "1zirwbvgwlkyi3zp3qnwfg2m83a8g65ffrfv74q29ijv9bfglw6g";
  };
  eunuch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-eunuch";
    rev    = "d02b2d0404134e6cae2708069d6888110d3c2272";
    sha256 = "06n30db4siaxdrpy3p856gjcp1yp4kpyf1nm4asysna0lfgc0gql";
  };
  fugitive = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fugitive";
    rev    = "19d1c944dbf59f252135688018610a12ce5718b4";
    sha256 = "1gpjqgn93jcdr0z4bhgk0nv16n89s4flvxhmvlvhzbqjjm3l1p8r";
  };
  ghcmod = fetchFromGitHub {
    owner  = "eagletmt";
    repo   = "ghcmod-vim";
    rev    = "815616e8b7d64677d6092e95bc6a3e83d2e035d4";
    sha256 = "00pl4zimbhcfpjg326qkjxr4s4d21kzl4j617382rvqbingrm8is";
  };
  haml = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-haml";
    rev    = "1f2e47c78c2faf90ff419c2f4e1241094844678c";
    sha256 = "0i741xmj0yk9cnvb7qiyy756yfbrlf7kbmq39470hi0cc9iqafbc";
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
    rev    = "005fe7804bf9cdde8abc1ad4308227250f5d5ac8";
    sha256 = "1m9pf8dzdvq9vyzdd7qwzfqlv9yizag6fp3ikir2d5gg6251amfi";
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
    rev    = "1891e7f167ef106ef135393bdb64217337ea440c";
    sha256 = "1877065grv8pw4swyhdmfjwqzmgh017805yq2ccnc49lyhisb0iv";
  };
  html5 = fetchFromGitHub {
    owner  = "othree";
    repo   = "html5.vim";
    rev    = "fccd580f5f11d576169ee347907c9fbd77af410a";
    sha256 = "1vccmccicaz86w7wcc29h0c2r41viz26lk9dryk7kq9a85x96rim";
  };
  hybrid = fetchFromGitHub {
    owner  = "w0ng";
    repo   = "vim-hybrid";
    rev    = "cc58baabeabc7b83768e25b852bf89c34756bf90";
    sha256 = "1c3q39121hiw85r9ymiyhz5zsf6bl9pwk4pgj6nh6ckwns4cgcmw";
  };
  idris-vim = fetchFromGitHub {
    owner  = "idris-hackers";
    repo   = "idris-vim";
    rev    = "e1711749f5078f5a9fa53cd15a37627ea9d239f2";
    sha256 = "0mbywk1mwbx3hjzrv7ypp5m800xjj08hxlfmd0piljg41xwkgk5q";
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
    rev    = "e0b9ef9ff42b91133d7da5d36d2c264994cc3cdd";
    sha256 = "089kfzhqbgqh52z4rx3b6gi9w5ksgnrdmzp223sbfk0ymfy94pjp";
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
    rev    = "209f77c9550a90b0b88492c93852195c171f6ebd";
    sha256 = "1ghspgjr6r0csmqacmsmkvrqvfgplx033yb3qwzddby991fpvfaa";
  };
  markdown = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-markdown";
    rev    = "4260faa48f5b89261f1168d4a1ad195106f5959c";
    sha256 = "0hpkwq588p6qrbqz02m3969xqz8mq4674fm8mbbx2kd0n74pz2n8";
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
    rev    = "d57b62f22d60f18b3bad0c5abc8c4bc99d35c5e5";
    sha256 = "1vni2q392k5f5i52l52ji2m5wq36mlz1hnwhr6n1pa3s5dfdd045";
  };
  minitest = fetchFromGitHub {
    owner  = "sunaku";
    repo   = "vim-ruby-minitest";
    rev    = "eeab4c88353555ee2115243ffc2e6cda852fd38c";
    sha256 = "1cgxgi1x7cylcxra2lywpiq2mbcr6n1lr11d7gczbgipjcn93ma1";
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
    rev    = "df959a20468c2f455b599d1d21de8d2c4334c7aa";
    sha256 = "1fq2hmd9i6ndj1jkcig1giyw6lvazhl5mfs86asi2a5j6r1wb983";
  };
  nerdcommenter = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdcommenter";
    rev    = "1f4bfd59920c101a30a74a07b824608a6e65f3fe";
    sha256 = "1xy7bzngz41vkpf5zvk07a5kypxqmw9g1a89ji8q5sbc4pka0y8j";
  };
  nerdtree = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdtree";
    rev    = "4ebbb533c3faf2c480211db2b547972bb3b60f2b";
    sha256 = "1r656xx1mc88x148w1bkr408932ji8640hb9bk92hjqvzrj5rsb9";
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
    rev    = "6f48575e748c22ccb3782bc02eb319b2b1b0f85d";
    sha256 = "1m9k5qakv9q35lvwq20vv1im58i5brh1f99dbx54pqri82zzk4zy";
  };
  pathogen = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-pathogen";
    rev    = "8c91196cfd9c8fe619f35fac6f2ac81be10677f8";
    sha256 = "17d1903spczg2rk0qzg94vvq41dwhmnxwajqgzcx4lmf606cfspi";
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
    rev    = "92dd6bc647b45444e9d5e0550bdc3c56928f9762";
    sha256 = "090vpff58lzzhqp28p27am5s8s6ngjxw6j4y46zaixcxxx7wqzha";
  };
  rails = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rails";
    rev    = "eb388f0836236de808d2deab227d2ec29d5c3d66";
    sha256 = "0lx1gghiwf81f06ff6xr7nv8m7ra67wkqhwgbmmrzd3cwjlh942c";
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
    rev    = "e590ca15ea8a35dd9f70f03273ee36ba6b6cb08b";
    sha256 = "15dwjayv7n20lp9i0lzbpjxbpvc61509ap55rg7308ynj9203knj";
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
    rev    = "a834e4357dd91252b507a6893ef19e8d932c5f83";
    sha256 = "0136sh1s0fskk6n4v5j1sjkpdh4v3yz3n3y81vymkq16gk8p8hxv";
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
    rev    = "371d6812d8d072d99f8191e0d49f0ab70475eaf5";
    sha256 = "058dz5rkjzq4421mfwrc3dsvc1clbnb5g7qprbb3mc0n3591qar8";
  };
  syntastic = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "syntastic";
    rev    = "e4f4acd9ae842b451965fa5779e64f8a60860838";
    sha256 = "1w40yyrp2k0r73a3w16kxfq5qxdwwxshvibk65iy169h9rjdjny4";
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
    rev    = "2bb17b766321270d45a9bbe5b57f90aaf45011c2";
    sha256 = "09fc9j6l5bcv44nz8cq1ibz2q5jnawzyfqfv8r9fi9b4z2igpkih";
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
    rev    = "25882e95cd8981308c4b2d87dcc2c2d6ecd73a6d";
    sha256 = "0dlc4080mc2klqlq7n7bknc5p495nlx42vgvz2ax1n97lahfmmm5";
  };
  unimpaired = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-unimpaired";
    rev    = "11dc568dbfd7a56866a4354c737515769f08e9fe";
    sha256 = "1an941j5ckas8l3vkfhchdzjwcray16229rhv3a1d4pbxifwshi8";
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
    rev    = "81ce9558b0f5c8f0b015042415566f02360c67d0";
    sha256 = "1ficrgm960dmg5i66p6hxh1qylfnd9yv71lr084w55gb95in1kfp";
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
    rev    = "600e64dbad928fb864bbee5eb73a0f7dae68e439";
    sha256 = "19n37iyr2xr7zy4f23cd2f11pdqbaqqa3242n6hnfqn7b3im4b35";
  };
  vim-git = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-git";
    rev    = "9e16c8853ec9eff37bc3b7836f6609a2c45dd041";
    sha256 = "1106zghzp0lll744qym59ymkcdbgasqm7h23ikxvycd11a82lbxy";
  };
  vim-go = fetchFromGitHub {
    owner  = "fatih";
    repo   = "vim-go";
    rev    = "6e1072e78c06eac707a5eb8b20b8362c803857a6";
    sha256 = "1g2xzz6rv6kqdbkq95c2fdgiq0hdiq81kx4njkp10hrg0jnha1df";
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
    rev    = "9378cddc1c264f777af59f04e5b8d64eca8ee5fd";
    sha256 = "0rp7lfci0n37l07lgn4fmgjgd9pdbrpm46izmrw3mh9czqmnc8xs";
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
    rev    = "b689ee4276d82feb21b21661a6500755ff6b2fde";
    sha256 = "1bdlbwxfjjf8x98f3k2wx1zip2054lphppsm37199bpbjym0vcwa";
  };
  vim-ruby = fetchFromGitHub {
    owner  = "vim-ruby";
    repo   = "vim-ruby";
    rev    = "666adb5bcdfb2d21572a58fcdf7545a26bac32a0";
    sha256 = "17hd3f1zg7x40v3xbkc2shklnjgwy9nk76hl07wavsxcz7r7xkr1";
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
    rev    = "b66ede5e0f7e5d5c637904e4a0f3241c75c6705b";
    sha256 = "1av8ydnj91ls177nhqcb32ih0j4yg34sw1hsys2lp6xcnpx5va4b";
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
    rev    = "3ab0a236e65b277670266c1187da9a49064c1500";
    sha256 = "1hnxd41bb3d0yby3vanhzx3k882k2gqndn05s6rmby9ncgfmb0gh";
  };
  vimwiki = fetchFromGitHub {
    owner  = "vimwiki";
    repo   = "vimwiki";
    rev    = "3bd3d9b86036b21aecd69f0a1e572643d626c280";
    sha256 = "073gpjsxqyv2pb716rmv9agip6rs89i58df3lc3c5pdg6967qliq";
  };
  vinarise = fetchFromGitHub {
    owner  = "Shougo";
    repo   = "vinarise.vim";
    rev    = "19f5271c22921920a96dfe59ac7949f0c6fcc39d";
    sha256 = "04xqfpfvw7719qkwy8h3dxnr3vvlifvpgy8hz866ik865662bcqc";
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