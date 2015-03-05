#!/bin/bash

#Company:       PowerCraft Technology
#Author:        Copyright Jelle de Jong <jelledejong@powercraft.nl>
#Note:          Please send me an email if you enhanced this script
#Version:       0.0.2
#Date:          28-02-07 / 18-11-07
#System:        Xubuntu 7.10
#Information:   man sed, man wc
#Information:   http://wooledge.org/~greg/foo.txt
#Information:   http://wooledge.org/mywiki/BashFaq#faq48
#Information:   http://wooledge.org/mywiki/BashFaq#faq50
#Category       Thunar scripts (thunar->edit->custom actions)
#Name:          Get Size
#Description:   Displays the total size of selected items
#Command:       ~/.scripts/thunar/directory-getsize.sh %F
#Patterns:      *
#Directories:   True
#Audio Files:   True
#Image Files:   True
#Text Files:    True
#Video Files:   True
#Other Files:   True

# Did the script work for you?
# Yes
# Yes, but with some errors
# Yes, but I had to change some things
# Not at all

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
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.



for I in "$@"
do
    query+=("${I}")
done

if [ -n "$query" ]
then
    total=$(du --summarize --total --block-size=1M "${query[@]}" | sed 's/\t/M: /')

    (( WIDTH = 35 + 7 * $(wc -L <<< "$total") ))
    (( HEIGHT = 80 + 23 * $(wc -l <<< "$total") ))

    whiptail --title "Total Disk Usage" --msgbox "$total" 8 78

fi

exit 0
