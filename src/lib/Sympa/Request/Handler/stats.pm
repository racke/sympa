# -*- indent-tabs-mode: nil; -*-
# vim:ft=perl:et:sw=4
# $Id$

# Sympa - SYsteme de Multi-Postage Automatique
#
# Copyright (c) 1997, 1998, 1999 Institut Pasteur & Christophe Wolfhugel
# Copyright (c) 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
# 2006, 2007, 2008, 2009, 2010, 2011 Comite Reseau des Universites
# Copyright (c) 2011, 2012, 2013, 2014, 2015, 2016 GIP RENATER
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

package Sympa::Request::Handler::stats;

use strict;
use warnings;
use Time::HiRes qw();

use Sympa;
use Sympa::Log;

use base qw(Sympa::Spindle);

my $log = Sympa::Log->instance;

# Sends the statistics about a list using template
# 'stats_report'.
# Old name: Sympa::Commands::stats().
sub _twist {
    my $self    = shift;
    my $request = shift;

    unless (ref $request->{context} eq 'Sympa::List') {
        $self->add_stash($request, 'user', 'unknown_list');
        $log->syslog(
            'info',
            '%s from %s refused, unknown list for robot %s',
            uc $request->{action},
            $request->{sender}, $request->{context}
        );
        return 1;
    }
    my $list     = $request->{context};
    my $listname = $list->{'name'};
    my $robot    = $list->{'domain'};
    my $sender   = $request->{sender};

    my %stats = (
        'msg_rcv'   => $list->{'stats'}[0],
        'msg_sent'  => $list->{'stats'}[1],
        'byte_rcv'  => sprintf('%9.2f', ($list->{'stats'}[2] / 1024 / 1024)),
        'byte_sent' => sprintf('%9.2f', ($list->{'stats'}[3] / 1024 / 1024))
    );

    unless (
        Sympa::send_file(
            $list,
            'stats_report',
            $sender,
            {   'stats'   => \%stats,
                'subject' => "STATS $list->{'name'}",    # compat <= 6.1.17.
                'auto_submitted' => 'auto-replied'
            }
        )
        ) {
        $log->syslog('notice',
            'Unable to send template "stats_reports" to %s', $sender);
        $self->add_stash($request, 'intern');
        return undef;
    }

    $log->syslog('info', 'STATS %s from %s accepted (%.2f seconds)',
        $listname, $sender, Time::HiRes::time() - $self->{start_time});
    return 1;
}

1;
__END__
