# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.433756801948856

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 1+2+7+24+25+38+42+44+50+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1EGF and resi 2 and name CA, 1EGF and resi 27 and name CA  # target=9.713977310826467 current=3.9460172738567425
color yellow, pair_00
distance pair_01, 1EGF and resi 35 and name CA, 1EGF and resi 45 and name CA  # target=4.166769778494215 current=9.19517207568466
color yellow, pair_01
distance pair_02, 1EGF and resi 3 and name CA, 1EGF and resi 24 and name CA  # target=12.963061423587167 current=8.93090139284948
color yellow, pair_02
distance pair_03, 1EGF and resi 40 and name CA, 1EGF and resi 51 and name CA  # target=18.30318784988839 current=14.283497521672281
color yellow, pair_03
distance pair_04, 1EGF and resi 39 and name CA, 1EGF and resi 48 and name CA  # target=15.533549813505665 current=12.390124786527993
color yellow, pair_04
distance pair_05, 1EGF and resi 7 and name CA, 1EGF and resi 21 and name CA  # target=12.517453988572703 current=9.413383216365297
color yellow, pair_05
distance pair_06, 1EGF and resi 28 and name CA, 1EGF and resi 47 and name CA  # target=21.445345336823806 current=18.470974906582764
color yellow, pair_06
distance pair_07, 1EGF and resi 41 and name CA, 1EGF and resi 50 and name CA  # target=14.85626199657104 current=12.069230403433115
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
