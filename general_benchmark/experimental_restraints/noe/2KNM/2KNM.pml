# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.879085332093487

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+8+9+11+14+16+17+18+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2KNM and resi 5
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2KNM and resi 5 and name CA, 2KNM and resi 26 and name CA  # target=3.807615173945761 current=7.773677490443867
color yellow, pair_00
distance pair_01, 2KNM and resi 3 and name CA, 2KNM and resi 26 and name CA  # target=3.807615173945761 current=6.936735282756118
color yellow, pair_01
distance pair_02, 2KNM and resi 7 and name CA, 2KNM and resi 24 and name CA  # target=3.807615173945761 current=6.221183193526359
color yellow, pair_02
distance pair_03, 2KNM and resi 5 and name CA, 2KNM and resi 14 and name CA  # target=3.807615173945761 current=5.765028746854851
color yellow, pair_03
distance pair_04, 2KNM and resi 3 and name CA, 2KNM and resi 27 and name CA  # target=3.6850847653642034 current=5.5776609514691655
color yellow, pair_04
distance pair_05, 2KNM and resi 2 and name CA, 2KNM and resi 27 and name CA  # target=4.463608091822635 current=6.004440845775519
color yellow, pair_05
distance pair_06, 2KNM and resi 5 and name CA, 2KNM and resi 13 and name CA  # target=3.807615173945761 current=5.174331324031146
color yellow, pair_06
distance pair_07, 2KNM and resi 1 and name CA, 2KNM and resi 28 and name CA  # target=3.711689012941624 current=4.852256626485406
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
