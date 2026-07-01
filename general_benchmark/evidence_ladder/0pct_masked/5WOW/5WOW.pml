# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.031262395636102946

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+2+9+11+12+13+14+35+36+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 14 and name CA, 5WOW and resi 36 and name CA  # target=23.707063355229984 current=24.271641259715445
color yellow, pair_00
distance pair_01, 5WOW and resi 14 and name CA, 5WOW and resi 35 and name CA  # target=23.466510473541884 current=24.018411219061413
color yellow, pair_01
distance pair_02, 5WOW and resi 11 and name CA, 5WOW and resi 35 and name CA  # target=23.343464930361435 current=23.840534355609815
color yellow, pair_02
distance pair_03, 5WOW and resi 12 and name CA, 5WOW and resi 35 and name CA  # target=23.325956867742967 current=23.821444288979723
color yellow, pair_03
distance pair_04, 5WOW and resi 11 and name CA, 5WOW and resi 36 and name CA  # target=23.232584572202892 current=23.67280128758315
color yellow, pair_04
distance pair_05, 5WOW and resi 15 and name CA, 5WOW and resi 36 and name CA  # target=23.16814098827554 current=23.607319781864135
color yellow, pair_05
distance pair_06, 5WOW and resi 12 and name CA, 5WOW and resi 36 and name CA  # target=23.12307983810166 current=23.509599844605926
color yellow, pair_06
distance pair_07, 5WOW and resi 15 and name CA, 5WOW and resi 35 and name CA  # target=22.797071906538587 current=23.096658030322676
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
