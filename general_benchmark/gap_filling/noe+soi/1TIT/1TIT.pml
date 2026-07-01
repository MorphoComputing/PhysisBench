# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 11.217199972362739

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 15+16+27+37+38+39+40+44+53+54
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 24+67+73+95+105+170
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 36 and name CA, 1TIT and resi 69 and name CA  # target=4.47460509597741 current=16.677548558864842
color yellow, pair_00
distance pair_01, 1TIT and resi 22 and name CA, 1TIT and resi 79 and name CA  # target=4.647636918307805 current=16.817557590860808
color yellow, pair_01
distance pair_02, 1TIT and resi 14 and name CA, 1TIT and resi 64 and name CA  # target=4.716934848280676 current=16.608417959457388
color yellow, pair_02
distance pair_03, 1TIT and resi 35 and name CA, 1TIT and resi 66 and name CA  # target=4.541917735763398 current=15.299788249650033
color yellow, pair_03
distance pair_04, 1TIT and resi 12 and name CA, 1TIT and resi 62 and name CA  # target=4.998412724151528 current=15.452259329997919
color yellow, pair_04
distance pair_05, 1TIT and resi 24 and name CA, 1TIT and resi 55 and name CA  # target=4.822327131090315 current=14.295069481715558
color yellow, pair_05
distance pair_06, 1TIT and resi 20 and name CA, 1TIT and resi 81 and name CA  # target=4.682015823900446 current=13.801370624728152
color yellow, pair_06
distance pair_07, 1TIT and resi 46 and name CA, 1TIT and resi 59 and name CA  # target=4.47460509597741 current=13.347778868794366
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
