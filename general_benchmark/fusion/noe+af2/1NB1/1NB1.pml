# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2481530383054575

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+3+5+6+8+22+24+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NB1 and resi 57
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NB1 and resi 2 and name CA, 1NB1 and resi 27 and name CA  # target=16.73863130491185 current=10.90995069074195
color yellow, pair_00
distance pair_01, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=4.839901528701486 current=8.492556207276483
color yellow, pair_01
distance pair_02, 1NB1 and resi 11 and name CA, 1NB1 and resi 27 and name CA  # target=17.666024050912 current=14.195422994196488
color yellow, pair_02
distance pair_03, 1NB1 and resi 3 and name CA, 1NB1 and resi 27 and name CA  # target=17.125978759005328 current=14.187613422287784
color yellow, pair_03
distance pair_04, 1NB1 and resi 10 and name CA, 1NB1 and resi 27 and name CA  # target=19.618089596798313 current=16.952817256965584
color yellow, pair_04
distance pair_05, 1NB1 and resi 12 and name CA, 1NB1 and resi 27 and name CA  # target=17.511183358882835 current=15.235293837315972
color yellow, pair_05
distance pair_06, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=3.711689012941624 current=5.7247644550124095
color yellow, pair_06
distance pair_07, 1NB1 and resi 9 and name CA, 1NB1 and resi 27 and name CA  # target=17.121403255915983 current=15.11127640769262
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
