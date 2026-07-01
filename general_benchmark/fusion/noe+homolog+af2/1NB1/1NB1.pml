# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.0483428524105662

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+3+5+6+12+19+22+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NB1 and resi 27+92
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NB1 and resi 3 and name CA, 1NB1 and resi 27 and name CA  # target=17.125978759005328 current=13.16157172496742
color yellow, pair_00
distance pair_01, 1NB1 and resi 11 and name CA, 1NB1 and resi 27 and name CA  # target=17.666024050912 current=14.02880061199377
color yellow, pair_01
distance pair_02, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=4.839901528701486 current=8.309072261925898
color yellow, pair_02
distance pair_03, 1NB1 and resi 10 and name CA, 1NB1 and resi 27 and name CA  # target=19.618089596798313 current=16.49815334946908
color yellow, pair_03
distance pair_04, 1NB1 and resi 4 and name CA, 1NB1 and resi 27 and name CA  # target=17.193185536559007 current=14.262406869755903
color yellow, pair_04
distance pair_05, 1NB1 and resi 2 and name CA, 1NB1 and resi 27 and name CA  # target=7.694213945398166 current=10.384485665417946
color yellow, pair_05
distance pair_06, 1NB1 and resi 9 and name CA, 1NB1 and resi 27 and name CA  # target=17.121403255915983 current=14.535269664659017
color yellow, pair_06
distance pair_07, 1NB1 and resi 1 and name CA, 1NB1 and resi 24 and name CA  # target=15.275669572227258 current=12.854271579461003
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
