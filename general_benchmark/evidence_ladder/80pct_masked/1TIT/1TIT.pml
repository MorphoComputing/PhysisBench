# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.4693745267827385

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 25+28+38+43+45+63+64+65+67+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 27+38+57+67+83+107
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 37 and name CA, 1TIT and resi 45 and name CA  # target=17.212623147345642 current=5.10130256541592
color yellow, pair_00
distance pair_01, 1TIT and resi 54 and name CA, 1TIT and resi 63 and name CA  # target=26.567727292629627 current=16.269388562258406
color yellow, pair_01
distance pair_02, 1TIT and resi 10 and name CA, 1TIT and resi 64 and name CA  # target=13.48378239013141 current=3.6827023139365043
color yellow, pair_02
distance pair_03, 1TIT and resi 28 and name CA, 1TIT and resi 67 and name CA  # target=27.49976746032754 current=17.723321183167826
color yellow, pair_03
distance pair_04, 1TIT and resi 27 and name CA, 1TIT and resi 71 and name CA  # target=19.451286578467013 current=9.797025078787506
color yellow, pair_04
distance pair_05, 1TIT and resi 7 and name CA, 1TIT and resi 45 and name CA  # target=19.84053203767893 current=10.23887328207436
color yellow, pair_05
distance pair_06, 1TIT and resi 45 and name CA, 1TIT and resi 80 and name CA  # target=20.50320721885272 current=11.551597963187616
color yellow, pair_06
distance pair_07, 1TIT and resi 46 and name CA, 1TIT and resi 69 and name CA  # target=15.64155985790424 current=6.837750951202174
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
