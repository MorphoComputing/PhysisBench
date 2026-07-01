# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.999438934189864

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+2+3+8+9+10+17+23+24+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2KNM and resi 6+7
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2KNM and resi 4 and name CA, 2KNM and resi 27 and name CA  # target=3.2686005254474764 current=7.664539351785031
color yellow, pair_00
distance pair_01, 2KNM and resi 2 and name CA, 2KNM and resi 28 and name CA  # target=4.524875361964364 current=8.31384490506743
color yellow, pair_01
distance pair_02, 2KNM and resi 6 and name CA, 2KNM and resi 14 and name CA  # target=3.2686005254474764 current=6.531802349113458
color yellow, pair_02
distance pair_03, 2KNM and resi 4 and name CA, 2KNM and resi 28 and name CA  # target=3.6850847653642034 current=6.869905689965792
color yellow, pair_03
distance pair_04, 2KNM and resi 20 and name CA, 2KNM and resi 28 and name CA  # target=4.319607547269556 current=6.911299058723216
color yellow, pair_04
distance pair_05, 2KNM and resi 6 and name CA, 2KNM and resi 26 and name CA  # target=6.797588029865607 current=4.350395247804006
color yellow, pair_05
distance pair_06, 2KNM and resi 7 and name CA, 2KNM and resi 26 and name CA  # target=5.212492862963047 current=6.555246197784914
color yellow, pair_06
distance pair_07, 2KNM and resi 6 and name CA, 2KNM and resi 15 and name CA  # target=3.2686005254474764 current=4.271588965849241
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
