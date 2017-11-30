# cower.md - Last Change: 2017 nov 30 13:29

NAME
       cower - a simple AUR downloader

SYNOPSIS
       Usage: cower <operation> [ options ] [ targets ]

DESCRIPTION
       cower is a simple tool to get information and download packages from
       the Arch User Repository (AUR). Invoking cower consists of supplying an
       operation, any applicable options, and usually one or more targets. If
       a target is specified as a lone dash (-), additional targets will be
       read from stdin.

# Installing programs
+ https://bbs.archlinux.org/viewtopic.php?id=114157
If I wanted to download Abiword-light and it's dependencies and then build it?
Would I do the following:

    cower -dd abiword-light
