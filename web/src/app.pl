#!/usr/bin/env perl6
use v6;
use lib 'vendors/DBIish/lib';
use DBIish;
use Bailador;

my $dbh = DBIish.connect('Pg',
    :host(%*ENV<POSTGRES_HOST>),
    :port(5432),
    :database(%*ENV<POSTGRES_DATABASE>),
    :user(%*ENV<POSTGRES_USER>),
    :password(%*ENV<POSTGRES_PASSWORD>),
    :RaiseError<1>
    );

my $sth = $dbh.prepare(q:to/STATEMENT/);
    SELECT * FROM a
    STATEMENT


get '/' => sub {
    my @results;
    $sth.execute();
    while (my $row = $sth.fetchrow_hashref()) {
        @results.push($row);
    }
    "hello world " ~ @results.perl
}

baile;