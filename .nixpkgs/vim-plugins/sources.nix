{ fetchFromGitHub }:
{
  ack = fetchFromGitHub {
    owner  = "mileszs";
    repo   = "ack.vim";
    rev    = "eede0425f50d92be89ee8fb4560a5afb707c2a54";
    sha256 = "18sjaf0zgxsl2jhlisvcvbk2llkvfsa3f66bprrh6d77nh6hiyrk";
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
    rev    = "4a0dd6e190f446e5a016b44fdaa2feafc582918e";
    sha256 = "1dz7rmqv3xw31090qms05hwbdfdn0qd1q68mazyb715cg25r85r2";
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
    rev    = "ce6cc2ea1afb69d0684bde08bed90ecfb96533a0";
    sha256 = "0a2ddfa4l06varp84g6zjmihmvsgks2pgcq4mzki61gjq44gmsx1";
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
    rev    = "354c429dad34f7d163663943c948f819588b53d3";
    sha256 = "040116lfi84al5ml8x3ar0r845m0zmy5fz1l5y9l0hlgrdjh8ihn";
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
  delimitMate = fetchFromGitHub {
    owner  = "Raimondi";
    repo   = "delimitMate";
    rev    = "b5719054beebe0135c94f4711a06dc7588041f09";
    sha256 = "03nmkiq138w6kq4s3mh4yyr6bjvqwj8hg6qlji1ng4vnzb0638q3";
  };
  dispatch = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-dispatch";
    rev    = "a54f2c5e18b8c2aad8c6f8ba474760e70fdaaca3";
    sha256 = "18z1hkr3qrgj9j0kr0q3i5vq27dpkjhsm3mqyssi6k5v0iyw49dk";
  };
  dockerfile = fetchFromGitHub {
    owner  = "ekalinin";
    repo   = "Dockerfile.vim";
    rev    = "1e2fdce5942da5ccc90ecd3ac99b6a3c58d52a4d";
    sha256 = "0qbbpby032dddwrxbxs7vni75i5qs959ygq90i47s67f0qng48hq";
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
    rev    = "0bd1892e8bb49e0884441879101383e176d85458";
    sha256 = "11hkdskgailiapsnc3vh3xmagyy6ixgayjrx7r5aykmqflapb6b7";
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
    rev    = "7eeb681ff3caedc1c01e50966bc293951f7b3e21";
    sha256 = "0hk4p1qjmplddmwrpp6b2x776z1298pkcgp855kgigib53w5srmc";
  };
  fugitive = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fugitive";
    rev    = "aac85a268e89a6c8be79341e130ac90256fadbd6";
    sha256 = "1hsq8lgw1gn99y0rr214bcc9vlw0kx8yajci7dimwhbh817kq5v4";
  };
  ghcmod = fetchFromGitHub {
    owner  = "eagletmt";
    repo   = "ghcmod-vim";
    rev    = "1d192d13d68ab59f9f46497a0909bf24a7b7dfff";
    sha256 = "0bzahgzagnf0a9zv86jhdf8nc3p0yfz9izv5n3lc8gc12cp47d0a";
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
    owner  = "itchyny";
    repo   = "vim-haskell-indent";
    rev    = "6716c07c84f587b44091af1d2a228d6e3e1b97d9";
    sha256 = "1bdrhfkgijdjh7hc4pvsnj3ykn97vrwfvvz2bv18r8vgc5y3p6v3";
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
    rev    = "bc7faabe7a4dfc0d963d6d8a406c3b7284e2866f";
    sha256 = "1nffgk4vijnm5iym56kb13537h3lzd41qqpfy8qsh4hmmccz7kpz";
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
    rev    = "7ef7a2ed9135d69a0dea6b571a20ddf2b0bf7a90";
    sha256 = "0py7vyg38yn6bl7pwyyhylpqp14smqjzbfj7rjzjfnlq33v7ysij";
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
    rev    = "713e530afe6d27de2afa63deb8e172cd97c0d48f";
    sha256 = "0ac6mz4rrrbz1c3g93nxa29dkgj7952xplbb7f0a6c0nr74w0pbr";
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
    rev    = "6e818d5614d5fc18d95a48c92b89e6db39f9e3d6";
    sha256 = "0rhqcdry8ycnfbg534q4b3hm78an7mnqhiazxik7k08a57dk9dbm";
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
    rev    = "3c2215bfed1de1251927fbc94b2631ca27c2958f";
    sha256 = "111ml6wqg1p5d6b95jk2jyqyhgvgcjbrm7ghdvvlg38zj4wx4mjd";
  };
  matchit = fetchFromGitHub {
    owner  = "tmhedberg";
    repo   = "matchit";
    rev    = "060d9d8aa381d6a650b649d38c992b59db3ed1a3";
    sha256 = "0ky5qbimdwprdmy9n93shyrs2a41vfgm9yj7v2q2db3zfsvpynld";
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
    rev    = "7f02a9c25fb272a87d2be092826e2cd3094c620d";
    sha256 = "1fcfk45qb96h6y4zb3p0104iyqc85q1synn9ah56zp6hnkkyffbw";
  };
  nerdcommenter = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdcommenter";
    rev    = "97cb982f1f0d0631b34b71b065e162916bee4036";
    sha256 = "136nirs1zi0pjz06yyw2q72ypwmmj25fkl9fjaqgc5q472d77d0v";
  };
  nerdtree = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "nerdtree";
    rev    = "334fb0e68797cf56d17db42bf56f39030f226cf8";
    sha256 = "0l36xjayrklhv8jizgdblb2gx6qpayyh06dzn0kd3h1m24n5462s";
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
    rev    = "dcf25798f4a3f75e9538f9915959061edbff97cf";
    sha256 = "1jaiqkspfz2a4ny130dl0h6x9752flpcwwy0kscrqmlqf5fqiyvm";
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
    rev    = "7ba2e1b67a8f8bcbafedaf6763580390dfd93436";
    sha256 = "1g15wzyw9b93n3icwpscx4b4qkn23snbmqjqp867ba0w0z3h6hpv";
  };
  psc-ide-vim = fetchFromGitHub {
    owner  = "FrigoEU";
    repo   = "psc-ide-vim";
    rev    = "3c376289d368b7175cb6c10e2960f08830ee4cb4";
    sha256 = "0mzczy73asw66qz3zqbf48i95qfjrv1rhky9zyl5qcwlay1gyfvj";
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
    rev    = "2c55bcefd63bc40ed2aa9d6ce9d89a590dfa3477";
    sha256 = "1y96w8p865gd6zr29wpxn1qwsk833y06x1qp586gylgi0jp1ybzv";
  };
  rails = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-rails";
    rev    = "09ffc844ef959ffe133d0994641ade192531007e";
    sha256 = "16ns8s1dkargf1zwlh7nrhmi718igfq9h7l4knjrr8y7q3p2bd1b";
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
    rev    = "deda14d977c7de0ce97585832c90a7ff75601ebb";
    sha256 = "1iv4d6gdqq3iqx0rwkpgh7abjv78a8b9ch1z7c2ac9y0vv10sl6v";
  };
  rust = fetchFromGitHub {
    owner  = "wting";
    repo   = "rust.vim";
    rev    = "58ee0eedc5f374e6bc5f6a3e215421ec4fe3635e";
    sha256 = "07mqhk7x5haawwzcm7fz64fhvc2xs64g0xpshh0h5ymw86hl1nkw";
  };
  scala = fetchFromGitHub {
    owner  = "derekwyatt";
    repo   = "vim-scala";
    rev    = "a6a350f7c632d0e640b57f9dcc7e123409a7bcd7";
    sha256 = "108c5h02vcb3pnr3si8dhwq3mv2pj5d83mj1ljxdk9595xv8j2rp";
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
    rev    = "4461789d02f81fd328afbdf27d6404b6c763c25f";
    sha256 = "0d227d2c1pvcksk2njzpkgmxivrnfb0apn2r62q7q89s61ggbzfj";
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
    rev    = "ce2e9d8b0a8d5af8f5845906fab6ee809b180dd4";
    sha256 = "0qg5dkbwiajps03wcn10ii0v7fzj515w2zlisf2njqci0zdzcvpj";
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
    rev    = "e49d6c2459e0f5569ff2d533b4df995dd7f98313";
    sha256 = "1v0q2f1n8ngbja3wpjvqp2jh89pb5ij731qmm18k41nhgz6hhm46";
  };
  switch = fetchFromGitHub {
    owner  = "AndrewRadev";
    repo   = "switch.vim";
    rev    = "fec2065ebd5c00723bc7e35d95991332ad6e53a3";
    sha256 = "1fkvfvdd89yl4p2vsygj5i7jn1j5403l6ij2mjcvama30mqz5cr7";
  };
  syntastic = fetchFromGitHub {
    owner  = "scrooloose";
    repo   = "syntastic";
    rev    = "90e96d445fef4cdf0d010df642076832d3571c32";
    sha256 = "1mvdrprpvsq7dvv0v0gwzhlam7gsml2mzc0xf1dkbwbmmcgwbsda";
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
    rev    = "00e1e7fcdbc6d753e0bc8043e0d2546fa81bf367";
    sha256 = "185jpisk9hamcwb6aiavdzjdbbigzdra8f4mgs98r9cm9j448xkz";
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
    rev    = "8c74564396e368788a5cb901b0e8017a3166cee9";
    sha256 = "15bh6q8g7p1giz2lybqhdf7a7xisqwpr751gprqx3vmh97drry5z";
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
    rev    = "97a280417b9ebcd098283b46ba9f144c6344bb8d";
    sha256 = "030n4f5mwxlq6qfizh82s5h8zlfm3qdh0lc3rc01p0nwbgpvyrg3";
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
    rev    = "1897d3b5342659ebaf737a723d476f6e86bc3b67";
    sha256 = "16qbw68gw6v1cdakxklql1zw8skh08kcp4dkmj7b221gc4s7qanw";
  };
  vim-css-color = fetchFromGitHub {
    owner  = "ap";
    repo   = "vim-css-color";
    rev    = "27903efc1b5330230d5c8c336c26ac7a8ac2e5dc";
    sha256 = "0yz76ryvbw1s84mih7a3ypx645jd92nbxaagszzi01ws2lfcymrm";
  };
  vim-exchange = fetchFromGitHub {
    owner  = "tommcdo";
    repo   = "vim-exchange";
    rev    = "b1cae9237e945803a2988f30d456e5bafb7b44f6";
    sha256 = "07c3wpw03i4j0g3b83s2z87bv4ww3mwii1pg6dmzip7d0i7k1rn4";
  };
  vim-fireplace = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-fireplace";
    rev    = "46af4344ee29c0e898c8142d395b472ee341de00";
    sha256 = "0kg5v745l94pfpznfddzjpqzy16c10r34x4g01qrkqqpsq1a3kwx";
  };
  vim-git = fetchFromGitHub {
    owner  = "tpope";
    repo   = "vim-git";
    rev    = "a08ca046128988beb3461d44de91524350be7678";
    sha256 = "0h7v1i565x1wd3qm5g3b8ddniq5qb2ji1c2fpqkaz2ia36vyr73a";
  };
  vim-go = fetchFromGitHub {
    owner  = "fatih";
    repo   = "vim-go";
    rev    = "7461762f787fa9a8c67820a2e3acfa03c5ec4e9b";
    sha256 = "0darh2s6phsmybdaskmj8vfdpslnicd14hnc62vsw9mbdf6ll752";
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
    rev    = "1d93f47eb4635a09f8b16e317ad65c98af2ee2cc";
    sha256 = "04wbi099y5kyqxcdz1qxp2afd79pqcb8xjshrd7vsng6s95kdbv2";
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
  vim-nix = fetchFromGitHub {
    owner  = "LnL7";
    repo   = "vim-nix";
    rev    = "b06cccd8ff61149b13d3fc8b7e0d06caa55c9888";
    sha256 = "0d1wxxijyyl449f81asl9d31kg0wvs3m0fypin172ahgpf3lyar4";
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
    rev    = "e865f7cacf05908668ed07be2db553f4fb4d56fd";
    sha256 = "0v9drrl3l8y4ixzcm1sq7gxl9p719bk3cfmsr9w68dmszpyi0vv1";
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
    rev    = "10a0f07ea6bbe75ec49e64358a1f920d9f1fa771";
    sha256 = "1hslicsxzs0a5c956r6wlip03437ilgv2z7i7zlbgybqfxshckvj";
  };
  vim-vroom = fetchFromGitHub {
    owner  = "skalnik";
    repo   = "vim-vroom";
    rev    = "a92fc7a8093c25cdabe1839f03ba4a09081d9d27";
    sha256 = "1a7wb63nphfr2nfkp0wfl3vlb1nrsm9jqg67ccz50xsfk8i4j1fr";
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
    rev    = "25cb83f24edec4aec1e9f1329302235e7a7a7fe0";
    sha256 = "19nl21623cv05j6ljyn35qm38pw3680nch2by1gapqmxazp99i20";
  };
  vimwiki = fetchFromGitHub {
    owner  = "vimwiki";
    repo   = "vimwiki";
    rev    = "4831384ab9f1c40c9e433857d958c4d9a7beb8ec";
    sha256 = "1wjbsd37h5fxkkia90h708mmqisdj0kxzm9k97jm2zq36zngmd86";
  };
  vinarise = fetchFromGitHub {
    owner  = "Shougo";
    repo   = "vinarise.vim";
    rev    = "f58fc77afa41aedaf766d452b6ce46daaccddce9";
    sha256 = "09x7a4dcrsqqvwsl7k8zbwr0gr0ynx486ka8slbi9v5jsnsvcgqq";
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
