{ fetchFromGitHub }:
{
  ack = fetchFromGitHub {
    owner  = "mileszs";
    repo   = "ack.vim";
    rev    = "303bceff1c8ab1145d114083582b1aeac9de7a85";
    sha256 = "1ddsyx0cjnmmmgcinja4nh1mbm9lq6kj4fplb39wwykvgq5wci2y";
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
    rev    = "d3a00f8affb091e7a14eb34f1beb9db9bb57a4bf";
    sha256 = "18xpx5zrx5rzgj1658im29kc14fmkgjbjrv72w4vyg25rj891jjn";
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
    rev    = "c0ad852dd453e4e9ac63cf7de89aae0c83f317a7";
    sha256 = "17wncb99kpappmppaapfjgw3h402bppjgy17gvq67b5af28z3x44";
  };
  bundler = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-bundler";
    rev    = "37096dbdcb84d89b17e6706f3e4e84da3c2a2990";
    sha256 = "0lsdyl5ghlaa8r29r8mm9yxrs8j98f9v2lx9gyid6i45z4rwhdfa";
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
    rev    = "3a5d9b9f58f9749d6632194a45f24884882ad93d";
    sha256 = "1cqlpha1jwyi14nlh5zagypjiam8if0pa0vq4n7c1r0cgbdq1y4n";
  };
  copy-as-rtf = fetchFromGitHub {
    owner  = "zerowidth";
    repo   = "vim-copy-as-rtf";
    rev    = "ce52bbaefb81ad90fdb7ee4ef12bda5731ff3378";
    sha256 = "07xz52gfrf18dln0k1d7d2q0gf12gy7h41vq1qkfa338j8fagxi6";
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
    rev    = "e1728c91413825baff257fef564c026f8a434186";
    sha256 = "060aim8j7sjvg1gl2y8rvjx9y11qan2mk735x3px4vyrpfjq3a9r";
  };
  dispatch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-dispatch";
    rev    = "9255742d23d15f53f88ac7dea43b1f4ee4f63c50";
    sha256 = "1fnmrwwl047q7fxiafan9ki5yqxlsacmdkkascrg2475a48m20xz";
  };
  dockerfile = fetchFromGitHub {
    owner  = "ekalinin";
    repo   = "Dockerfile.vim";
    rev    = "0b7cd551b9a0b70a26c7d3c10689e0ba164c39f4";
    sha256 = "0385pdg8cy4i4v6hb2hbbcnhyqzd1r4cy0df189mqgdmik4sg3qs";
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
    rev    = "350c8e6dffdef7fe68402334111632d267a0beb2";
    sha256 = "0yy344af7xnksw5snvma9ndlvx0vi15sljragjmcz8307hr145xy";
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
    rev    = "38541f3dbe53f0431a9181561c3b609d58b92d06";
    sha256 = "0h09njk06dbbpc7s03vnmrirx240y377v9k0mvhvrgvlm9v71sgp";
  };
  eunuch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-eunuch";
    rev    = "c856e5d649b9f87590aff66a84b930fce5793431";
    sha256 = "0wlhf4h17rwyfr5ll928pawyrdjvllc3jc6rx8sgzjqbsj96ywx8";
  };
  fugitive = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fugitive";
    rev    = "9af975c82c99318b908c61b12e443e8ba6dea217";
    sha256 = "0sv36gkch85lf3cx1imb31ig21dmjvz2rr6f2d7axnajxa946k7n";
  };
  ghcmod = fetchFromGitHub {
    owner  = "eagletmt";
    repo   = "ghcmod-vim";
    rev    = "6f27c1365d95b280002a9668cba8d151ce516daf";
    sha256 = "0r7ra2cic3xxy0vj6irz9mz7m4mc4iay8gx5248a606hw3ayy61y";
  };
  haml = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-haml";
    rev    = "18ff62828c1c2449b0da8c1a980dace3b4f73610";
    sha256 = "00lkxjyfxk51p3p40mcj6qdsa4dqgzd0d1va7348lcyshi11ils3";
  };
  handlebars = fetchFromGitHub {
    owner  = "nono";
    repo   = "vim-handlebars";
    rev    = "1eeeff8ade7b5008e7a213cc7eb9c7e1bed52bef";
    sha256 = "085l3vhb4pzdw24dykr1glykrgyyhsxyb56w323iv21zmk4y46np";
  };
  hasksyn = fetchFromGitHub {
    owner  = "zkf";
    repo   = "hasksyn";
    rev    = "3e084d61d3abd9136b1c2178955ac4227581b60b";
    sha256 = "14mcsxggw0dzix7lfpc0ph6l5cb86dzh0y9cdbxvanlf7x46r1rm";
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
    rev    = "29085ae94ee3dbd7f39f2a7705d86692ef5bc365";
    sha256 = "0kvys81jiwqzwmpbk1lvbciw28yha4shd1xby5saiy4b68l6d8rk";
  };
  html5 = fetchFromGitHub {
    owner  = "othree";
    repo   = "html5.vim";
    rev    = "10dca03366fca80a2b9ec7aed49d2864bcadb8ef";
    sha256 = "0l9yqqm2jm5jwq311pmk4p6mxi39i4pwfd59vanav7nm4idnwbb9";
  };
  hybrid = fetchFromGitHub {
    owner  = "w0ng";
    repo   = "vim-hybrid";
    rev    = "81b7e5584f69340eec92088efda893d959d6df3a";
    sha256 = "111bcv9kknjr7b6gg2svhi6v22xjz33w9145kcjzlccrm65bwd1l";
  };
  jasmine = fetchFromGitHub {
    owner  = "claco";
    repo   = "jasmine.vim";
    rev    = "50cae137f8308cdfdf70010232a852a364549411";
    sha256 = "13b33ils3807xpzpklwxdcb9w00q8rcbrcb9fff8c8qzmaan1gya";
  };
  javascript = fetchFromGitHub {
    owner  = "pangloss";
    repo   = "vim-javascript";
    rev    = "f8122fd1caca68b2592553e43dad45b3dc445a06";
    sha256 = "0r1g69n1c03m3m6wzkjcdqs2yw3rrr30afjqr4m3niwqhydi7gkh";
  };
  jellybeans = fetchFromGitHub {
    owner  = "nanotech";
    repo   = "jellybeans.vim";
    rev    = "0761708c890becd3e027551068e0ae272da003e0";
    sha256 = "112z4j4f6jnwzfzvbps68h0g13c54hca2kn2y4x7d968m5xmxsq4";
  };
  jellyx = fetchFromGitHub {
    owner  = "guns";
    repo   = "jellyx.vim";
    rev    = "3ec30731cd2bcd48e842e1f151d6cf2fd7690a9b";
    sha256 = "06b7xczdq633qsbx7nxj8j30bpdrxr1mgqw3zdq22mnl1xvr50j4";
  };
  latex-box = fetchFromGitHub {
    owner  = "LaTeX-Box-Team";
    repo   = "LaTeX-Box";
    rev    = "24f9a59ed23623d7b859112a5191c7eb50843f7d";
    sha256 = "1lsrxgmv9lhb7fqcwngkqpdxzjlzkkf0nl2gq0rkmhmql02a2cvk";
  };
  less = fetchFromGitHub {
    owner  = "groenewege";
    repo   = "vim-less";
    rev    = "5d965c221b90fb168bf9f447a332c9ff6f62e666";
    sha256 = "0pin5a5qy1l5zbb4ynfv2dz35dgw87yff5xv8dx7b3f63l8g1kwl";
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
    rev    = "cd81c2f209f3ab813b5bd6012fa513b434ef1249";
    sha256 = "1ygw9gr4j520nx9lrsggwhg29akm5gbh3xkhpyb0lc1nv49x76cb";
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
    rev    = "e77ac79b6a0165f889a5705ace75568aea853193";
    sha256 = "1wq41dn2abr9i14cpwynv03j7h9swql3dkns50ki0q2bifvrhzwi";
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
    rev    = "0311f31b3acaccec5b651ae7089d627a3a49239b";
    sha256 = "19863k66ln2gbqymkwz2xz227qxgmraq6nkl8zkcxsan9ksjjbrh";
  };
  nerdcommenter = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdcommenter";
    rev    = "6549cfde45339bd4f711504196ff3e8b766ef5e6";
    sha256 = "0jfzjd65z86588ggic4714xa1811449j8072g8mnld2la7j4k5c6";
  };
  nerdtree = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdtree";
    rev    = "579d96a0f3b8414916a158c24d8ee9131c5f6845";
    sha256 = "1gvvbqk40kanzwlihb3w2363qiwipvk55r2m06sspsqqk65nfp1q";
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
    rev    = "aa586b5397dc8cf3bc741f13064bb682fbcc8191";
    sha256 = "11cg9xivwaxbrcsflyq784a606c9qd1727dm3lnmy9lp2yijdc46";
  };
  nodejs = fetchFromGitHub {
    owner  = "mmalecki";
    repo   = "vim-node.js";
    rev    = "0b5146fa9bd69cba9ce8690c164271a726e3b7b8";
    sha256 = "0ynkii4njya6jdnah1sd41a6ppq7awcp212rpg96ilr5jqbah1yn";
  };
  pathogen = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-pathogen";
    rev    = "ed01fca95c271ab83e14b041aded328a9f9574a7";
    sha256 = "1axqsb2hd6qwx0pmqx4kmyxzxsc9mc30zm89hjsiagb3ic6hl7wm";
  };
  puppet = fetchFromGitHub {
    owner  = "ajf";
    repo   = "puppet-vim";
    rev    = "eccd0e9e1e93acd92e4fd9a67ad07d8737ab4b47";
    sha256 = "0gsfx6f04x0b6vyl7g8lraxc6ilzn2h1l56aqcbs8s5fnqs2lsn1";
  };
  rails = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rails";
    rev    = "48387c5d58ffec37c41cf86b2e785f73084b7eab";
    sha256 = "04wr9syxi3ksawqpw7av3y8jwjmnakn9vlxq5zihxpm545xlv1gx";
  };
  rake = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rake";
    rev    = "32a2a0d94ca307bbe88d9d8df675ecc2c368ed78";
    sha256 = "0prndc3gpzw64h5hkjx1skbp8v1dd8yh92bfzpmzvyk6zc68fspg";
  };
  rspec = fetchFromGitHub {
    owner  = "thoughtbot";
    repo   = "vim-rspec";
    rev    = "94a256b7e02f5056cab197d9b079901858737324";
    sha256 = "056srv66605qdmsivnf2hmb3wwr023q1pscvcxbgm5dghzbbgmh0";
  };
  rust = fetchFromGitHub {
    owner  = "wting";
    repo   = "rust.vim";
    rev    = "d34f1252859bcbb006c117e58b59ed736ffa96f0";
    sha256 = "126jniy0v87r0053m34zadq25k2gpvfz3ad3jfsnwcqvbv3r2p03";
  };
  scala = fetchFromGitHub {
    owner  = "derekwyatt";
    repo   = "vim-scala";
    rev    = "8f5a9642606e81fe8bb15ccb99031915f1d0a8d8";
    sha256 = "16rsp6b9jbj9vbi3jam4318w61ads42z7liskk8yapavwmambf8j";
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
    rev    = "63aaab6b3ad8fde5142d8b08313ebf272fae8395";
    sha256 = "02b1d0a7qrg5w0dbni3myxrzd7g8ys0imjwj0wlj020mp86b4p0c";
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
    rev    = "f85cb4e788356f664d033e8519abdd8e1bc26762";
    sha256 = "1l3kpv7qmb2lbyd5sm5yrbf5p3p8193nra1272jy3p95p699i9dw";
  };
  switch = fetchFromGitHub {
    owner  = "AndrewRadev";
    repo   = "switch.vim";
    rev    = "1bce1be77030de6cb1d13705b350aad7354f36d8";
    sha256 = "1n74kgbafnc3bag8m9cskxmi6p4sfa6lpdfsxfqnlaa2i66k0n86";
  };
  syntastic = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "syntastic";
    rev    = "4c5ff427230823e80a81aee98f0de8137d163aaa";
    sha256 = "0az0mv37ijx25n4ir1m8yjms4c2bq4qlxlh4098k2kaxhra2bpa5";
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
    rev    = "b82f8804c4987b2534a5411d492d15d6010e98d2";
    sha256 = "1d6wpz5p42nks94flbfgpzx30aad1rkd6knxvcpakdvksyczda23";
  };
  tomorrow-night = fetchFromGitHub {
    owner  = "chriskempson";
    repo   = "vim-tomorrow-theme";
    rev    = "8add71a5fada87b8db25971fd5807bb8a35fde13";
    sha256 = "1a0s9vnbpgc7pvmpdiksw3xyg44vxdpbnqr8kq4fk2s7sxhwhh40";
  };
  ultisnips = fetchFromGitHub {
    owner  = "SirVer";
    repo   = "ultisnips";
    rev    = "ccf79ba82377da622fd5ac499113a2f5670332ca";
    sha256 = "08z450fnqimcvznq06pq30iwippppkd83jblf4vi4jhgyrfsxhi8";
  };
  unimpaired = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-unimpaired";
    rev    = "2791b1f27ec9eae210e27917c2d8b9c73bba9687";
    sha256 = "1ggjdggynwgp7h93jfnszkwczfasik4cjk5jvf7yf8bqh2xz42j3";
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
    rev    = "d978de518c1f4eae68f976f9b016d0767880dc27";
    sha256 = "06h68lqdj6jbz5y5jkvq7hk0wwlz295vfls080dnd86g7wqy51b8";
  };
  vim-css-color = fetchFromGitHub {
    owner  = "ap";
    repo   = "vim-css-color";
    rev    = "fb725aa7f6fbd0ce38f9e952c4064a924c6317c7";
    sha256 = "1rvn7w5kq0bi2ylv85jgfyivqy1p5h7vqd8n7vcgfgbx6lfqgq1l";
  };
  vim-exchange = fetchFromGitHub {
    owner  = "tommcdo";
    repo   = "vim-exchange";
    rev    = "f841536eace341ef229f48eb6f9cef3d0cd98be4";
    sha256 = "0w0z5imh6w3zmicrc225c4wsixg5giyzmibrmnd7r05dz6ckd733";
  };
  vim-fireplace = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fireplace";
    rev    = "835fdedf5fc9fa2354306738dd96c3a984c35485";
    sha256 = "0bi6ca5zii0zx17jm3l6sb8zxw14vnbwkd0nw3wf54sf4jq76r6i";
  };
  vim-git = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-git";
    rev    = "44836a451ada9efc33565e073a83561a723e6df9";
    sha256 = "0b1nylx5fmfpx9l8ixl78w4xqk9l04lzkgvxki66sqc1613hsdrl";
  };
  vim-go = fetchFromGitHub {
    owner  = "fatih";
    repo   = "vim-go";
    rev    = "a8ba4bcfaafb0d38085721645a95136cfe2b7203";
    sha256 = "10sq00jibhrxbxsylmwdc5dn36msfk19fszi15qcc8zczmki3zyv";
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
    rev    = "78fffa609b3e6b84ef01ee4c9aba6d7435d7b18e";
    sha256 = "1bxbd2zsxyg3pwp3bs738fhf8mhzk72hrxmw273fy55f2qscm57m";
  };
  vim-indexed-search = fetchFromGitHub {
    owner  = "henrik";
    repo   = "vim-indexed-search";
    rev    = "00f17fbb4ee9cbcf67640ee3360e472108b2d51a";
    sha256 = "1896qw4wwp0sbn4dknk6dqg3p45zh0ksjkj2vhbqw1six78iy46a";
  };
  vim-ls = fetchFromGitHub {
    owner  = "gkz";
    repo   = "vim-ls";
    rev    = "152e8aba2123993d15e1da1badf7ae2d65289a44";
    sha256 = "03lbdhg3nkishx2r8f871r0f6isf92ydrqwpf94aag1j3grlv501";
  };
  vim-ragtag = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-ragtag";
    rev    = "12e379989e3258af0934e10173386235c7d69944";
    sha256 = "0xb71g3j28ark1ki8zwglagi8d1xgkdv3lahn4jflnrfvsywwzv7";
  };
  vim-redl = fetchFromGitHub {
    owner  = "dgrnbrg";
    repo   = "vim-redl";
    rev    = "a5f13665fa35ec38d7af42e40f6588be50e86e76";
    sha256 = "0s59qr2w30nkaim86sjks2j560pdk1n8r8c9yl8r547y6jcjb5cj";
  };
  vim-repeat = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-repeat";
    rev    = "2a3c5f8e3c26a57b8eb4cfc4be79615a1c508ef6";
    sha256 = "0dsc7766n25mybx1sx91dh53dw2qriq10nh87pwfxdbpqmcwijpn";
  };
  vim-rsi = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rsi";
    rev    = "dd22d12e1dae68849fac39030d3bb389d83c47e1";
    sha256 = "14qhp561dwq2bzx2l7smhz9xmmcp9v0pwfq3k3a7fb3bijl03g5i";
  };
  vim-ruby = fetchFromGitHub {
    owner  = "vim-ruby";
    repo   = "vim-ruby";
    rev    = "78244da5f31847213cbe79e48d1ee5a38514b6c1";
    sha256 = "1q6x0s96pqw532i1lnr3pcvyv6h6md38cf43cjks5j2njkf8biy0";
  };
  vim-sexp = fetchFromGitHub {
    owner  = "guns";
    repo   = "vim-sexp";
    rev    = "0c81175975889206184b69ca9875f4328b1f616e";
    sha256 = "1s514xz7826xi6085v2w272cgxvc88mkz7l0529j4qq54wp23ggf";
  };
  vim-sexp-mappings-for-regular-people = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-sexp-mappings-for-regular-people";
    rev    = "1b577bcc8a87e934134148367d47d1b0d0c8a89b";
    sha256 = "10i3y1i4fhsgs3yax4aflypx0v39qnvln2dnlxmm61g1hdrgi2ky";
  };
  vim-vroom = fetchFromGitHub {
    owner  = "skalnik";
    repo   = "vim-vroom";
    rev    = "030833ef3273462dcd583bd573632f8e1fd2775f";
    sha256 = "113q3yvfqyhfbwkx1f0la6k8z3ik3239aq8ypnp6hhra72ylhrgp";
  };
  vimerl = fetchFromGitHub {
    owner  = "jimenezrick";
    repo   = "vimerl";
    rev    = "22ced3c4b42e06ad59e6ff344dbf82e4ace3ada8";
    sha256 = "1fd50401qs3zifycwzg9vf3s43p4k3d7jqvnshpa6v170zp3xr09";
  };
  vimproc = fetchFromGitHub {
    owner  = "Shougo";
    repo   = "vimproc.vim";
    rev    = "c1bdfe05f6aee5a2b67bd8e223d70fcb9bd2812e";
    sha256 = "05mpjw9cfaxxz31xiaqrgfr52l42i1nzab3qxmikxp713hakkl02";
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
    rev    = "87c05c7e051ab32dd9bf4d4c7f655d11816942a6";
    sha256 = "03h4vwq8fdhsmzsrcrv4zvlxqdv5l63w16n5zdzzqq41ln8k4n3n";
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