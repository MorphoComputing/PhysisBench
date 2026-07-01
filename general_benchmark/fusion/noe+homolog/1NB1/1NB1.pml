# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.7965825039654033

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+6+10+12+13+14+23+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=4.839901528701486 current=6.8679641700433445
color yellow, pair_00
distance pair_01, 1NB1 and resi 3 and name CA, 1NB1 and resi 20 and name CA  # target=4.781959614572202 current=3.267320366947428
color yellow, pair_01
distance pair_02, 1NB1 and resi 13 and name CA, 1NB1 and resi 24 and name CA  # target=9.544443706885874 current=8.55741186166005
color yellow, pair_02
distance pair_03, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=3.711689012941624 current=4.673649502373397
color yellow, pair_03
distance pair_04, 1NB1 and resi 1 and name CA, 1NB1 and resi 23 and name CA  # target=12.131980335063844 current=11.428551069379655
color yellow, pair_04
distance pair_05, 1NB1 and resi 14 and name CA, 1NB1 and resi 23 and name CA  # target=4.03399379435194 current=4.7091606196115645
color yellow, pair_05
distance pair_06, 1NB1 and resi 1 and name CA, 1NB1 and resi 25 and name CA  # target=14.55558424794416 current=13.907872200499646
color yellow, pair_06
distance pair_07, 1NB1 and resi 4 and name CA, 1NB1 and resi 21 and name CA  # target=5.898051984791269 current=5.267588465971103
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
