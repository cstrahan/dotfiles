## lolcatify.pl
our $VERSION = '0.01';
use strict; use warnings FATAL => 'all';

## Configurable save location.
## Non-portable path. Alter as-needed.
my $SAVED_CATS_TO = $ENV{HOME} . "/.irssi/saved_lulzcats" ;


## I often find there are people on IRC who are completely obnoxious,
## but make enough noise that flow of discussion becomes confusing
## when making use of /ignore -- I'd rather just turn them into a lolcat,
## so rather than stab myself in the thigh every time a monkey bangs on
## his keyboard, I can giggle like a girl.
##
##  -> /load lolcatify.pl
##  -> /lolcat help

use Irssi ();
our %IRSSI = (
  name        => 'lolcatify',
  authors     => 'Jon Portnoy',
  contact     => 'avenj@cobaltirc.org',
  description => 'Turn a user into a lolcat',
  license     => 'perl5',
);


{
  ## Inlined Acme::LOLCAT
  package
    Acme::LOLCAT::Inline;
  use strict; use warnings FATAL => 'all';

	my %repl = (
   	what     => [qw/wut whut/],   'you\b'   => [qw/yu yous yoo u/],
   	cture    => 'kshur',          unless    => 'unles',
   	'the\b'  => 'teh',            more      => 'moar',
   	my       => [qw/muh mah/],    are       => [qw/r is ar/],
   	eese     => 'eez',            ph        => 'f',
   	'as\b'   => 'az',             seriously => 'srsly',
   	'er\b'   => 'r',              sion      => 'shun',
   	just     => 'jus',            'ose\b'   => 'oze',
   	eady     => 'eddy',           'ome?\b'  => 'um',
   	'of\b'   => [qw/of ov of/],   'uestion' => 'wesjun',
   	want     => 'wants',          'ead\b'   => 'edd',
   	ucke     => [qw/ukki ukke/],  sion      => 'shun',
   	eak      => 'ekk',            age       => 'uj',
   	like     => [qw/likes liek/], love      => [qw/loves lub lubs luv/],
   	'\bis\b' => ['ar teh','ar'],  'nd\b'   => 'n',
   	who      => 'hoo',            q(')      => q(),
   	'ese\b'  => 'eez',            outh      => 'owf',
   	scio     => 'shu',            esque     => 'esk',
   	ture     => 'chur',           '\btoo?\b'=> [qw/to t 2 to t/],
   	tious    => 'shus',           'sure\b'  => 'shur',
   	'tty\b'  => 'tteh',           were      => 'was',
   	'ok\b'   => [ qw/'k kay/ ],   '\ba\b'   => q(),
   	ym       => 'im',             'thy\b'   => 'fee',
   	'\wly\w' => 'li',             'que\w'   => 'kwe',
   	oth      => 'udd',            ease      => 'eez',
   	'ing\b'  => [qw/in ins ng ing/],
   	'have'   => ['has', 'hav', 'haz a'],
   	your     => [ qw/yur ur yore yoar/ ],
   	'ove\b'  => [ qw/oov ove uuv uv oove/ ],
   	for      => [ qw/for 4 fr fur for foar/ ],
   	thank    => [ qw/fank tank thx thnx/ ],
   	good     => [ qw/gud goed guud gude gewd/ ],
   	really   => [ qw/rly rily rilly rilley/ ],
   	world    => [ qw/wurrld whirld wurld wrld/ ],
   	q(i'?m\b)     => 'im',
   	'(?!e)ight'   => 'ite',
   	'(?!ues)tion' => 'shun',
   	q(you'?re)    => [ qw/yore yr/ ],
   	'\boh\b(?!.*hai)'  => [qw/o ohs/],
   	'can\si\s(?:ple(?:a|e)(?:s|z)e?)?\s?have\sa' => 'i can has',
   	'(?:hello|\bhi\b|\bhey\b|howdy|\byo\b),?'    => 'oh hai,',
   	'(?:god|allah|buddah?|jesus)'                => 'ceiling cat',
	);

	sub translate {
  	my $phrase = lc( shift() // return );

  	$phrase =~ s{
                	$_
              	}
              	{
                	ref $repl{ $_ } eq 'ARRAY'
                  	? $repl{ $_ }->[ rand( $#{ $repl{ $_ } } + 1 ) ]
                  	: $repl{ $_ }
              	}gex
              	for keys %repl;

  	$phrase =~ s/\s{2,}/ /g;
  	$phrase =~ s/teh teh/teh/g; # meh, it happens sometimes.
  	if( int rand 10 == 2 ){ $phrase .= '.  kthxbye!' }
  	if( int rand 10 == 1 ){ $phrase .= '.  kthx.' }
  	$phrase =~ s/(\?|!|,|\.)\./$1/;

    uc($phrase)
	}

}

## $lulzcats{ $mask } = time()
our %lulzcats;
restore_cats( $SAVED_CATS_TO )
  if -e $SAVED_CATS_TO;

Irssi::command_bind lolcat => sub {
  ## Dispatcher.
  my ($msg, $server, $win) = @_;

  my ($cmd, @params) = split ' ', $msg;

  my %disp = (
    help => \&lolcat_help,
    add  => \&lolcat_add,
    del  => \&lolcat_del,
    list => \&lolcat_list,
  );

  $cmd = lc( $cmd ||= 'list' );
  $cmd = 'help' unless defined $disp{$cmd};

  $disp{$cmd}->($server, $win, @params)
};

Irssi::signal_add "message public"  => \&incoming_msg;

## FIXME configurably add privmsg handler?
#Irssi::signal_add "message private" => \&incoming_msg;

sub incoming_msg {
  my ($serv, $msg, $nick, $addr, $target) = @_;

  MASK: for my $mask (keys %lulzcats) {
    if ( $serv->mask_match_address($mask, $nick, $addr) ) {
      Irssi::signal_continue(
        $serv,
        Acme::LOLCAT::Inline::translate($msg),
        $nick, $addr, $target
      );

      last MASK
    }
  }

};

sub lolcat_help {
  my ($server, $win, @params) = @_;

  my @help = (
    "Usage:",
    " lolcat help",
    " lolcat list",
    " lolcat add <mask>",
    " lolcat del <mask>",
  );

  print_cur(
    window => $win,
    lines  => \@help,
  );
}


sub lolcat_list {
  my ($server, $win, @params) = @_;

  unless (keys %lulzcats) {
    print_cur(
      window => $win,
      lines  => [ "I haz no lulzcats." ],
    );
  } else {
    my @output = ( "I haz cats:" );

    push( @output,
      " - " . $_
    ) for keys %lulzcats;

    print_cur(
      window => $win,
      lines  => \@output,
    );
  }
}

sub lolcat_add {
  my ($server, $win, @params) = @_;

  my ($mask) = @params;

  unless (defined $mask) {
    print_cur(
      window => $win,
      lines  => [ "I haz no cat to add!" ],
    );

    return
  }

  $mask = normalize_mask($mask);

  $lulzcats{ $mask } = time();

  print_cur(
    window => $win,
    lines  => [ "I now haz cat $mask" ],
  );

  save_cats( $SAVED_CATS_TO );
}

sub lolcat_del {
  my ($server, $win, @params) = @_;

  my ($mask) = @params;

  unless (defined $mask) {
    print_cur(
      window => $win,
      lines  => [ "I haz no cat to lose!" ],
    );

    return
  }

  if (delete $lulzcats{ $mask }) {
    print_cur(
      window => $win,
      lines  => [ "I no haz $mask nao." ],
    );
  } else {
    print_cur(
      window => $win,
      lines  => [ "I no can find cat $mask to delete!" ],
    );
  }
}

sub save_cats {
  my ($file) = @_;

  my @output;
  for my $mask (keys %lulzcats) {
    my $ts = $lulzcats{$mask};
    push( @output,
      "$mask $ts\n"
    );
  }

  return unless @output;

  open my $fh, '>', $file
    or warn "Could not open $file to save lulzcats: $!"
    and return;

  print $fh @output;

  close $fh;

  1
}

sub restore_cats {
  my ($file) = @_;

  open my $fh, '<', $file
    or warn "Could not open $file to restore lulzcats: $!"
    and return;

  my @input = readline($fh);

  close $fh;

  for my $line (@input) {
    chomp $line;

    my ($mask, $ts) = split ' ', $line;

    $lulzcats{ $mask } = $ts;
  }

  1
}


sub normalize_mask {
  my ($orig) = @_;
  return unless defined $orig;

  ## Inlined with some tweaks from IRC::Utils

  ## **+ --> *
  $orig =~ s/\*{2,}/*/g;

  my @mask;
  my $piece;

  ## Push nick, if we have one, or * if we don't.
  if ( index($orig, '!') == -1 && index($orig, '@') > -1) {
    $piece = $orig;
    push(@mask, '*');
  } else {
    ($mask[0], $piece) = split /!/, $orig, 2;
  }

  ## Split user/host portions and do some clean up.
  $piece        =~ s/!//g if defined $piece;
  @mask[1 .. 2] = split( /@/, $piece, 2) if defined $piece;
  $mask[2]      =~ s/@//g if defined $mask[2];

  for ( 1 .. 2 ) {
    $mask[$_] = '*' unless defined $mask[$_];
  }

  $mask[0] . '!' . $mask[1] . '@' . $mask[2]
}

sub print_cur {
  my %args = @_;
  $args{lc $_} = delete $args{$_} for keys %args;

  return unless defined $args{lines}
    and ref $args{lines} eq 'ARRAY' ;

  if (ref $args{window}) {
    $args{window}->print($_) for @{ $args{lines} };
  } else {
    Irssi::print($_) for @{ $args{lines} };
  }
}
