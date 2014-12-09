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
    rev    = "78ed0c065ee65c8368f1f10566b96cd890c14358";
    sha256 = "0mrgnralyc61g0nakksiibxdk0769m72b8cks5bpgp2x1ia60k8g";
  };
  dockerfile = fetchFromGitHub {
    owner  = "ekalinin";
    repo   = "Dockerfile.vim";
    rev    = "ee3bb01d29204dac01f5e10ffeab5f995171ca6f";
    sha256 = "1zfydw81dm1zcf701w90z2fyhpnvvqdw1bnn8ckhicnmqk5lbh6r";
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
    rev    = "109e6bf8c59ed5cdd8217e43b0355d709698261a";
    sha256 = "0pcwzncmy3jfr5rnj4l618w4d8xkgakji6xg7vw8y51xm9ayy3qz";
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
    rev    = "96eb11755bb2d1a5583d44e9bcd10481bca45693";
    sha256 = "1ar5j7j870b4q0j8dl0r4mfr2sazb7zr9zy0q5zcaf3p4nq8rs6h";
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
    rev    = "2c8461db084d205903a792a23163faa546f143c9";
    sha256 = "0aw98kmipq2w85822wdw57vy9qg6v51rx9nhbrhilw3nwpzfvaw9";
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
    rev    = "e7bc28fb41742003ffbe4953da1f05279acf7fab";
    sha256 = "002845vzgs9gqz6nni79dbam852xfhin27pkc43kz1hgv2i5zpcx";
  };
  html5 = fetchFromGitHub {
    owner  = "othree";
    repo   = "html5.vim";
    rev    = "abaf4f8a829bd01cc460eb63768debc7c28a6ff5";
    sha256 = "0mxnab225mv7kc7207pkljz3c62816b38i3ri8rn83vl0ira7x73";
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
    rev    = "a140249caa79c35c09f4dca3201e1189b3721da3";
    sha256 = "1mv63d8r0k7g0575rzvii6ldqv208xy09fzprbx1zj44axrr9l59";
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
    rev    = "05fdf7eac615a2bb0fa5870668fd65b6f284dd65";
    sha256 = "1wwz8nany1zpxs88xy76kym25gxb3fh6nab8f2rg8p6v4zwk6zv0";
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
    rev    = "f7d264fc27b3dfcbc54f8b16f3ae6aea4f92ee4c";
    sha256 = "0ifc1gm496k1jsmvzcmvf79i6g1laqcz29vabj102bajzscih6vm";
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
    rev    = "102821b867781de273022f1381750a329168a42f";
    sha256 = "0cs4rh4win1fzi1idg07xi68kdjz2jgfwpzl3p6kb6ilhqfwqrjr";
  };
  rust = fetchFromGitHub {
    owner  = "wting";
    repo   = "rust.vim";
    rev    = "0fd423990cfa69336fb6c1d5d58aa2091e7b4e76";
    sha256 = "09ywa4gah516j9jcpxxjwh8bbsqbng0y3z8n8qwvs4h8zw0w2f5h";
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
    rev    = "0e8907ff9e426f07cc50839bf6da7ad25af2d5d0";
    sha256 = "0npswdyvf8fh7fdx6kw70rac6mdsymzmckjclzwbiykphd0pgvsm";
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
    rev    = "4e8bf429613e85c568c382c0612ef32e4c0eaa28";
    sha256 = "1i1z2gnlvc7659rb87d4q6xnjfynwr8frms6fmnr3ym2f9lpr9n3";
  };
  syntastic = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "syntastic";
    rev    = "6fdd39438896b5a209f4cbdb40abd2c1f5f7555e";
    sha256 = "1p5a4zxlvvzf8cysz2pifd9w3ar5zkwbwkzv2bas6myys77a8h2x";
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
    rev    = "b730863d67f26e01868fee5a9a680a0c721bd44a";
    sha256 = "0q4bppx1jl26k6rpkafkbd8nsxkz6fdw5xib65d3b6ia5y598y21";
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
    rev    = "67630f4aea1c77a7b74a5f922d93c751fbfd53d4";
    sha256 = "1in7y6x5lhbpcas4wgd09q1c71d7cr7y7jds4x2as5llsdzaf1hd";
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
    rev    = "6fb8960f311531ec2db3070207112d069dc45381";
    sha256 = "06rbmjgf5ycjwhl7py1l2bv3a4lxp936rjdijgkkgq6kqs3jyrlc";
  };
  vim-exchange = fetchFromGitHub {
    owner  = "tommcdo";
    repo   = "vim-exchange";
    rev    = "fd0e870abddc75527b14fcc50a55417917c69958";
    sha256 = "1spqa7myy8s1gsrj5bqqj0ahq4g62dfb68nqz8g660n456x8axxy";
  };
  vim-fireplace = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fireplace";
    rev    = "874505e9f292767e85503573365f613d0ead3895";
    sha256 = "1z8fnvmv3d0nr4bvwz49x74fb5x61ph4gpc1ra3bgdhmjvzbmvnc";
  };
  vim-git = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-git";
    rev    = "297e7075a1c6ecc4547e6543cda394e28c5b1c06";
    sha256 = "1y3fs7m2mg482n06a9rabwpydkh0h9vrmmwr8r4ir5bdrqzzg0if";
  };
  vim-go = fetchFromGitHub {
    owner  = "fatih";
    repo   = "vim-go";
    rev    = "b5d9d2e362f501316f1d315e35b0ae61d5200266";
    sha256 = "1g4p5hnnqbwhs7lwsnzglha5r4hddlz0m96pmj2n5fppqpfr9y22";
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
    rev    = "5eba0f19c87402643eb8a7e7d20d9d5338fd6d71";
    sha256 = "1fir3s16iy5kvrjihj3xfcfks301lq0fjmasdyh3575apjlj7v3x";
  };
  vim-rsi = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rsi";
    rev    = "ec39927fcbb53a77e628b2d138e0a43caa945a3b";
    sha256 = "1mjbg32zrqw5xnx00jsv8yi6v6ydahn1zlrbj5igqysyldakp9sv";
  };
  vim-ruby = fetchFromGitHub {
    owner  = "vim-ruby";
    repo   = "vim-ruby";
    rev    = "243d021449115235505350764bff00859ce4224f";
    sha256 = "19hr5d5667h488qxl05lzx74qaxfs0zffcbmfypiil2zs3l2g9f7";
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
    rev    = "ac2db9ee7a72aa7532c03cf09a21a3642e2b6e82";
    sha256 = "17xxncb6sz4lqjr217byf0607d5ba5r71ilpjcizz98k19z4ghkd";
  };
  vim-vroom = fetchFromGitHub {
    owner  = "skalnik";
    repo   = "vim-vroom";
    rev    = "ffc2985734fb964d4d072a925ea7d0041c716893";
    sha256 = "1yx32p9piwrzpdrm726p3ryiz4qwg2nh3w1y5zlhax2gwf6a7c8m";
  };
  vimerl = fetchFromGitHub {
    owner  = "jimenezrick";
    repo   = "vimerl";
    rev    = "65984e84b9d91ebd99260b5ca9986e0b31b2b848";
    sha256 = "1p7pda56krbcb6hb4wgj2xws6w57y97q2cwgibsv1nhpqkvgs53j";
  };
  vimproc = fetchFromGitHub {
    owner  = "Shougo";
    repo   = "vimproc.vim";
    rev    = "9baa1ca5deeab9687b987b336507a9c531faa5f6";
    sha256 = "1d3hby95v4vv7lyp6hmfr56fjgnwxwfq0wjfw6z4jynwnafxxp9g";
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
    rev    = "ede1192eedb83271dea2a465133c4146bc22832d";
    sha256 = "042iipklpmpxk28yywhzigjbx731zrq2xqnaz2iqvbsq0jwlmh29";
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