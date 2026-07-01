# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.9612450602688327

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 3+6+7+10+12+17+18+23+25+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 4 and name CA, 1NB1 and resi 18 and name CA  # target=5.642462590198753 current=3.90940617145896
color yellow, pair_00
distance pair_01, 1NB1 and resi 3 and name CA, 1NB1 and resi 12 and name CA  # target=13.111782995340523 current=11.606055741915414
color yellow, pair_01
distance pair_02, 1NB1 and resi 3 and name CA, 1NB1 and resi 16 and name CA  # target=7.9011624480719185 current=9.238171570236716
color yellow, pair_02
distance pair_03, 1NB1 and resi 11 and name CA, 1NB1 and resi 20 and name CA  # target=11.332462280653642 current=12.3019450983115
color yellow, pair_03
distance pair_04, 1NB1 and resi 1 and name CA, 1NB1 and resi 11 and name CA  # target=8.942587702545481 current=9.787064135700227
color yellow, pair_04
distance pair_05, 1NB1 and resi 6 and name CA, 1NB1 and resi 22 and name CA  # target=14.0322370023891 current=13.253138830587934
color yellow, pair_05
distance pair_06, 1NB1 and resi 6 and name CA, 1NB1 and resi 14 and name CA  # target=13.835472192264461 current=13.091487038160595
color yellow, pair_06
distance pair_07, 1NB1 and resi 3 and name CA, 1NB1 and resi 24 and name CA  # target=15.109121888312368 current=14.396985411657484
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
