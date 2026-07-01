# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.086429329159636

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+8+9+11+16+17+22+23+24+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 19 and name CA, 2KNM and resi 28 and name CA  # target=4.734597146117251 current=7.387810093524181
color yellow, pair_00
distance pair_01, 2KNM and resi 5 and name CA, 2KNM and resi 14 and name CA  # target=3.807615173945761 current=5.911754805836305
color yellow, pair_01
distance pair_02, 2KNM and resi 7 and name CA, 2KNM and resi 25 and name CA  # target=4.15551083370725 current=6.014669547245322
color yellow, pair_02
distance pair_03, 2KNM and resi 5 and name CA, 2KNM and resi 26 and name CA  # target=3.807615173945761 current=5.383712399352608
color yellow, pair_03
distance pair_04, 2KNM and resi 5 and name CA, 2KNM and resi 25 and name CA  # target=7.39019949670469 current=5.995331567919054
color yellow, pair_04
distance pair_05, 2KNM and resi 2 and name CA, 2KNM and resi 27 and name CA  # target=4.463608091822635 current=3.1772247076414804
color yellow, pair_05
distance pair_06, 2KNM and resi 7 and name CA, 2KNM and resi 21 and name CA  # target=5.526827568351721 current=6.735381496601554
color yellow, pair_06
distance pair_07, 2KNM and resi 2 and name CA, 2KNM and resi 28 and name CA  # target=4.298255009038828 current=5.499601688036032
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
