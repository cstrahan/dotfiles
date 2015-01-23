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
    rev    = "e70e049bfd1f4dce1d55881c4eee3e4320121cfc";
    sha256 = "0wc3p3p8czhg8x2in64ppzf5sv3jk00wf3vycs41bcslmghmx8w3";
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
    rev    = "851a73721737409bef2d076c7547fefa1fa93684";
    sha256 = "1pv98qdgvljbx4h8gqf9j16p8halnajgpqsrj5fw3sgaanpigmmq";
  };
  bundler = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-bundler";
    rev    = "48abb774c72732a75f8ab05ee7493b1041dd8ae8";
    sha256 = "1dyb49nh94in4pmnz47gjmk05fah9mx6qz2dp9w5vjd7ssrlq8pd";
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
    rev    = "3d640a8baa6d1934d2b5d5d0df059595413cdfaf";
    sha256 = "015hrj05j6fsc32ahyvrshyh4f34wy0h2r8prpsahjnjsmaap2n9";
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
    rev    = "8f4826012771e6ce7871923bed1bbb68834c8dfc";
    sha256 = "06gnp4acrhd8wfym3gl7ralfxx3p80wcf8hvvgmdq8zlj9jabydy";
  };
  dispatch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-dispatch";
    rev    = "77455b92048bb00fef752be1218a174a05d0c2b6";
    sha256 = "1p50wmzsvrvsali7ny7i9yp0kw6nyjb2x91gb6crzf1qxjijlxr3";
  };
  dockerfile = fetchFromGitHub {
    owner  = "ekalinin";
    repo   = "Dockerfile.vim";
    rev    = "f5e94427a55acb1c09d7d909df00237d1d8d7068";
    sha256 = "14czihq8py8f0lcqhx865qbqpdbnbrqs28a2ly290mdy9429772r";
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
    rev    = "d59784e7afbd0d55c501e40c43b57cbe6f6e04c2";
    sha256 = "0dnhh0g29g2jgf6gzlj8vvqqxq0bim5ixg9hvj78adhkzchy6vr0";
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
    rev    = "bba43b831ae0485cf9b86d16340a6a314b927391";
    sha256 = "17jval3h4lvvzg9w84xdmq997ymws1mmhalz3p13f15vrd8sn234";
  };
  eunuch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-eunuch";
    rev    = "8c996336ceecbfb7290c7c9b409195f190866548";
    sha256 = "023jcnkk1cpxraybcz5spqqpn4m9vl9fik72yj77152qy5mfnd19";
  };
  fugitive = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fugitive";
    rev    = "34719016ec934609387e90804ad49b3d221f0b19";
    sha256 = "0f2ad31h4ycc63s8a2nhnyd3mq2g0fx6d5vb5i71xwvhh7l43y16";
  };
  ghcmod = fetchFromGitHub {
    owner  = "eagletmt";
    repo   = "ghcmod-vim";
    rev    = "d5c6c7f3c85608b5b76dc3e7e001f60b86c32cb9";
    sha256 = "1d0s3gm0g6jnn0wx5dlcrjvn9ixfbrlv1d4wg8iv63dr0z6qlhwd";
  };
  haml = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-haml";
    rev    = "204e32721154766e03e99ff857bc798aa5b741dc";
    sha256 = "01z67dglvfxiwsr3iyz6vzzy5rhaz6vlwx544d1ilskqnmai7if5";
  };
  handlebars = fetchFromGitHub {
    owner  = "nono";
    repo   = "vim-handlebars";
    rev    = "1eeeff8ade7b5008e7a213cc7eb9c7e1bed52bef";
    sha256 = "085l3vhb4pzdw24dykr1glykrgyyhsxyb56w323iv21zmk4y46np";
  };
  hasksyn = fetchFromGitHub {
    owner  = "travitch";
    repo   = "hasksyn";
    rev    = "c434040bf13a17ca20a551223021b3ace7e453b9";
    sha256 = "09998lnfcshqis5m062wlag6y476imq9jday9gp4ayjjl1cp3cwx";
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
    rev    = "13eaf3588e5a5f17dbd86848337de8e7ed735cca";
    sha256 = "1v2w5mb5hf41ryhbasrwxzmw80nw0jd1v6dnc5x78bx2q53m05mg";
  };
  html5 = fetchFromGitHub {
    owner  = "othree";
    repo   = "html5.vim";
    rev    = "a47aa2d274daf8675a2b20577b75d573f4c2dfc5";
    sha256 = "1k2nq1q6sxlmp4laq9bkmdwc37rlvpqkmcbm7y971habrxwn3k36";
  };
  hybrid = fetchFromGitHub {
    owner  = "w0ng";
    repo   = "vim-hybrid";
    rev    = "471b235306b94850a3c6b1d2d9e5203e9919c15e";
    sha256 = "1ykrddb7vyll6wv20k9m74nymwp255ik9s36z5x56fyw96y3w6kk";
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
    rev    = "f4058e2f981e2ab9ad8c8125695bdba035cc9ecb";
    sha256 = "0gjg4jahddzvisfdy3kvzplly612ak3clgvm6p5z9mkshxywnd9h";
  };
  less = fetchFromGitHub {
    owner  = "groenewege";
    repo   = "vim-less";
    rev    = "940a8defa0576385dee1ad177bab0b34738540aa";
    sha256 = "0dwfj8wnvqvjhhb1w63gy69qaj9p0kysgy5rsir4cplrn1ms586w";
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
    rev    = "409c37b205afa2f9d590e23de8171482d66770e2";
    sha256 = "0m8zv47k7165snbv0wn6hizc8wjzcwjffhvakm969j22sbla360m";
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
    rev    = "43d8ef49cdc45f601276c90dccee9aa62b8ea3c1";
    sha256 = "0ckkf4wzlp6xg8hzaf3h06zqx2xbrp87pk3mqhlsx16zpyynqqm2";
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
    rev    = "3b98a7fcae8f9fff356907171f0406ff8cd28921";
    sha256 = "16rn4yw6lsb9pjs6ywvpd6pwchnxdi937jcp07mdj2z4lk535la2";
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
    rev    = "cb6d4e34eb4f3353e522bc0815061c41f4e47f49";
    sha256 = "0hb2rh99vclprf8j15wg8085ni927jsam5d4fx6bh3r2s24l3k37";
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
    rev    = "b9fb0dfd811004010f5f6903edef42d6004ebea2";
    sha256 = "1ixl1lhrsx8aync3nk217w4ps7vpawh7rm0nlxmah6k546bpxv32";
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
    rev    = "b5ccdb47f0b0001bf263a80315d3b6bca7bc3b2e";
    sha256 = "10gr8ac6rsj8ghi0zdwawlz3zg1lvgw1avbp3xzjmkpv6cz4wv7d";
  };
  rake = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rake";
    rev    = "13533d90cfcc735cf4e187eb0c223289ed2dbb1c";
    sha256 = "1bv2fgbrjjjmkv0cs6jmiidk36w5dbms6kiri3cvzahkvdnf4i25";
  };
  rspec = fetchFromGitHub {
    owner  = "thoughtbot";
    repo   = "vim-rspec";
    rev    = "491057ebf56afd8dcbf37d8e0ce2210e5f0e8049";
    sha256 = "1ksyc7ipccxww922yhinrpcdn8364iq9hn2bbdncwp625hx3sb12";
  };
  rust = fetchFromGitHub {
    owner  = "wting";
    repo   = "rust.vim";
    rev    = "08bb56fbdb61380621db6fe36a24d0a3d176f7a0";
    sha256 = "0y5mv8ps259ij18fyx42iqszhzqnnvi6b3pcgz11hf51i4yhb033";
  };
  scala = fetchFromGitHub {
    owner  = "derekwyatt";
    repo   = "vim-scala";
    rev    = "80a16cf8dc9eea18980fbe34a6d6dd3e1b6df290";
    sha256 = "1qfzc6lzhf23dl323hfm320cfh1dwbifvf2vh6zgvvjnmzpina69";
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
    rev    = "74d6ddd78f572b63adc6dfb35e5ae9edc9af6b75";
    sha256 = "0ds86cag121rgkrr4jcgsmm3lwsafq7pllfily4fmx9sjp55cas8";
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
    rev    = "fa433e0b7330753688f715f3be5d10dc480f20e5";
    sha256 = "15azfrblpyywwlx30hcwy7f4068lkz3v5qlk1q6gxzvkds1wdcm7";
  };
  switch = fetchFromGitHub {
    owner  = "AndrewRadev";
    repo   = "switch.vim";
    rev    = "3b9007f1636246351431ef715749113784511fbf";
    sha256 = "0cx8597gm0cf4bsw1qzpkfq9ffh27782k41qwl9vjgz2bb6ghb3i";
  };
  syntastic = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "syntastic";
    rev    = "bcaf7cbcc9c21f3d70f1d699e84397cb5a5812dc";
    sha256 = "16pncbnmnmm9va2q170s64hny8bfxq8yzz6bndqh8akm1fv1pmp0";
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
    rev    = "9e629767e5a91ede057d07f8754326e68c92a692";
    sha256 = "0c9bm9xj9awwlifi6cijd5rz90jv3i44xp6gy1idhli4l5rl3wd1";
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
    rev    = "d693259abb2e28f70abf760d395fcf526d5272ee";
    sha256 = "0iir3p4k8jxzbznn04bb7km1ycspdzr4rih99bp9jq0va88da16q";
  };
  unimpaired = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-unimpaired";
    rev    = "3548479cc154154cbdbb6737ca08a47937cc7113";
    sha256 = "0p2siip5xf20mg4z1z3m4mp90m026ww3cnkk1n9rc02xhp5xvpsg";
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
    rev    = "bdf57577b8c1f3677da788f93490209688870e58";
    sha256 = "0sh35kr96b6i28crxqihkcabdmsci53qc96jhlim7y7s7d1xfqgh";
  };
  vim-css-color = fetchFromGitHub {
    owner  = "ap";
    repo   = "vim-css-color";
    rev    = "e44b2b983b39e63a92660385791c5fe8e3dedb5d";
    sha256 = "0l721zhzsmqz5kakk79qirjr4x9kzkc6f83hhrynbqd0w8az2cb2";
  };
  vim-exchange = fetchFromGitHub {
    owner  = "tommcdo";
    repo   = "vim-exchange";
    rev    = "5cb2a3733a99ddb93863a10acd7b86aa9af490c5";
    sha256 = "0r2xiidnyvx5jk74pfb1shmj1nlrbkhn58hqsg3y11qqn1zzjbam";
  };
  vim-fireplace = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fireplace";
    rev    = "b999b09cd9d69f359fa5668e81b09dcfde455cca";
    sha256 = "1csq2fwnds5bsjnjdr66w5ia2mh39a70ja3jpcq4bdb7i24qa27p";
  };
  vim-git = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-git";
    rev    = "36126609572d95e93cc8b06f73670fbbf3a3736a";
    sha256 = "08hgfn1glsnjs01lz53aw3zqg19fhx0yimhjgrv9658a52a9dgwi";
  };
  vim-go = fetchFromGitHub {
    owner  = "fatih";
    repo   = "vim-go";
    rev    = "f3b757d4150cbe018a8a02ef1c484f161dde9686";
    sha256 = "00vmi0f6aqlnchf34dn1h94b9aynx3qhjj50ldhbp4f0q73rkawf";
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
    rev    = "e983774bacc03f4dd633bb9fd923db2c8e3ad254";
    sha256 = "0x5wjbasc3avdf138ax4yvxgy72zxp7yky47zik84zvdhrjak1dl";
  };
  vim-ls = fetchFromGitHub {
    owner  = "gkz";
    repo   = "vim-ls";
    rev    = "86faf383e693043e93dd4d8208be4dfbae048ec6";
    sha256 = "0n0i0s61srkifr4b5z8prcgvln7cj0wpm4hlgs8dzvsh8yrz8pr2";
  };
  vim-ragtag = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-ragtag";
    rev    = "07115a6dee0ae01b7c9c3d92e9ee3219b6780b77";
    sha256 = "01i1cxglwkc41405x96qhdhrh2ykfickgbnyi9x75jjv5pyxv3x4";
  };
  vim-redl = fetchFromGitHub {
    owner  = "dgrnbrg";
    repo   = "vim-redl";
    rev    = "c986fa26ea092aacd5bd4f535d1fe88abeac054a";
    sha256 = "0li3xb710dmp3piprmn90yqfwyxvxgday0brz6hr5hsqzvzm7j74";
  };
  vim-repeat = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-repeat";
    rev    = "bd3b51723559ceefe36484fbd35524a98062ba8e";
    sha256 = "00vlda1p1zjk73xzxh6dvhp5ki1lvimc6srkab9xx62l6yp8a8d2";
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
    rev    = "4661bf70f428c0436ea60d9ba515b4b8dca73f0d";
    sha256 = "18jgh2r0ndmxns5xgnaa2acq5bkljxdv21qahaqyxnlkvad04mhs";
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
    rev    = "f5b66e73c81a3b4c0c8f5a8141fb09a5a213f711";
    sha256 = "1kf3bkv9wppxgifybd972avdd2563ra2387n7qc6q72b2r9mx5aa";
  };
  vim-snippets = fetchFromGitHub {
    owner  = "honza";
    repo   = "vim-snippets";
    rev    = "147001fb019b63546a4f5b6c1201fc4a0bb89240";
    sha256 = "0b95p64y5sgymjhdim7pav4r4cslyn9xlrmaby85ib8r7mmm4760";
  };
  vim-vroom = fetchFromGitHub {
    owner  = "skalnik";
    repo   = "vim-vroom";
    rev    = "beb350fc741942891318e94e1e4025e7b1cdffca";
    sha256 = "142h5ylk29l6q3zlmqnva9cawk4azp0zg6q10c37b454a1vrkdn0";
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
    rev    = "4c496c7281f73bb90b86816088d3a5f01e03297e";
    sha256 = "0la91pr9d02wqs9qnighlfdkaqrfph7nz6038b52r1gjlgzxjscs";
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
    rev    = "45a18a2a242e930bd44d8b523ed67ded8fc740fb";
    sha256 = "07vgzfnhn3qlvqs8fln9bfcnzwsn1h9m57w74mi9pwcvanfhj5nn";
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