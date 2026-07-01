# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.6727711769884026

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+2+5+6+10+11+12+13+16+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1L2Y and resi 2+13
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1L2Y and resi 4 and name CA, 1L2Y and resi 18 and name CA  # target=14.823477420527286 current=8.078596229059492
color yellow, pair_00
distance pair_01, 1L2Y and resi 1 and name CA, 1L2Y and resi 18 and name CA  # target=13.55475405198975 current=8.53867221560764
color yellow, pair_01
distance pair_02, 1L2Y and resi 1 and name CA, 1L2Y and resi 9 and name CA  # target=17.234612348213474 current=12.570729868309282
color yellow, pair_02
distance pair_03, 1L2Y and resi 2 and name CA, 1L2Y and resi 12 and name CA  # target=18.199902140871888 current=13.811070390755138
color yellow, pair_03
distance pair_04, 1L2Y and resi 7 and name CA, 1L2Y and resi 15 and name CA  # target=15.111972106695513 current=11.553691062378643
color yellow, pair_04
distance pair_05, 1L2Y and resi 4 and name CA, 1L2Y and resi 15 and name CA  # target=7.2718706116097875 current=10.684798863615914
color yellow, pair_05
distance pair_06, 1L2Y and resi 2 and name CA, 1L2Y and resi 13 and name CA  # target=10.349326583908674 current=13.470972772327308
color yellow, pair_06
distance pair_07, 1L2Y and resi 2 and name CA, 1L2Y and resi 10 and name CA  # target=6.87987581656335 current=9.927250504214893
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
