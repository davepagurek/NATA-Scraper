#!/usr/bin/perl

use v5.10;
use strict;
use warnings;

use URI;
use Web::Scraper;
use Encode;
use Data::Dumper;

# USAGE
#
# ./scraper.pl
# or
# perl scraper.pl
#
# Change $round to scrape http://www.ngtournament.com/$round for the entrant list.
# It then looks at the $moviesToCheck recent movies from each user's Newgrounds
# page to find movies tagged with $roundTag.
my $round = "novice";
my $roundTag = "nata2015open";
my $moviesToCheck = 2;
my @entrants = qw(
    dylan
    AmazingSpin
    BooneBum
    Britbau
    brynimation
    CarelessShenanigans
    DocJoshimitsu
    Emvium
    Flikkernicht
    GlassesX7
    gunboyisawesome
    HowardWimshurst
    jlorp
    LazyModeComics
    Magnivez
    MCakeri
    MihaP
    Perrobang
    RebellionFA
    ryardo12345
    scottwjsm
    SirDuckDee
    SleepDeprivedChicken
    Spinalpalm
    sweetcommando
    TheSilleGuy
    tontie777
    TrohPee
    TyyobrO
    visedgrub
    ZazDupree
);


my $participants = scraper {
    process "h3 + ul li", "entrants[]" => "TEXT";
    result "entrants";
};

my $movieURLs = scraper {
    process ".movies a", "movies[]" => '@href';
    result "movies";
};

my $entry = scraper {
    process ".tags ~ dd a", "tags[]" => "TEXT";
    process ".podtop h2", "title" => "TEXT";
    process "#main script:nth-of-type(5)", "flashvars" => 'RAW';
};

print "Entrants:\n\n";
#my $entrants = $participants->scrape( URI->new("http://www.ngtournament.com/$round") );
for my $entrant (@entrants) {
    print "$entrant\n";

    my $urls = $movieURLs->scrape( URI->new("http://$entrant.newgrounds.com/movies/") );
    my @movies = grep {
        $roundTag ~~ @{ $_->{tags} || [] }
    } map {
        $entry->scrape( URI->new($_) )
    } splice @{ $urls }, 0, $moviesToCheck;

    if (my $movie = $movies[0]) {
        if ($movie->{flashvars}) {
            $movie->{flashvars} =~ s/&amp;/&/g;
            $movie->{flashvars} =~ s/&lt;/</g;
            $movie->{flashvars} =~ s/&gt;/>/g;
            $movie->{flashvars} =~ s/&quot;/"/g;
            $movie->{flashvars} =~ s|\\/|/|g;
            ($movie->{video}) = ($movie->{flashvars} =~ m{"url":"(http://.+?\.(?:mp4|swf|wmv))});
        }

        print "\t$movie->{title}\n";
        #print "\t$movie->{url}\n";
        #print "\t$movie->{flashvars}\n" if $movie->{flashvars};
        print "\t$movie->{video}\n" if $movie->{video};
    } else {
        print "\tNo entry yet!\n";
    }
    print "\n";
}

__END__
Output looks like:

Entrants:

AmazingSpin
        Lizardman Xander (NATA2015OPEN)
        http://www.newgrounds.com/portal/view/659337

BooneBum
        Strauss
        http://www.newgrounds.com/portal/view/659456

Britbau
        Third Law
        http://www.newgrounds.com/portal/view/659436

brynimation
        Ten amazing facts!
        http://www.newgrounds.com/portal/view/659430

CarelessShenanigans
        Ten Fabulous Facts!!!
        http://www.newgrounds.com/portal/view/659299

DocJoshimitsu
        NATA Open Round 2015
        http://www.newgrounds.com/portal/view/659365
