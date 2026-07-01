# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.47727315974061574

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 9+10+11+14+15+16+47+48+50+53
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1POH and resi 10 and name CA, 1POH and resi 67 and name CA  # target=27.47426597247642 current=33.13195577332628
color yellow, pair_00
distance pair_01, 1POH and resi 11 and name CA, 1POH and resi 67 and name CA  # target=27.466252746299197 current=32.8479909347228
color yellow, pair_01
distance pair_02, 1POH and resi 10 and name CA, 1POH and resi 66 and name CA  # target=27.432310491771673 current=31.739401484541972
color yellow, pair_02
distance pair_03, 1POH and resi 11 and name CA, 1POH and resi 66 and name CA  # target=27.397765090800373 current=31.21019760397604
color yellow, pair_03
distance pair_04, 1POH and resi 56 and name CA, 1POH and resi 67 and name CA  # target=27.383568938021703 current=30.862601136237622
color yellow, pair_04
distance pair_05, 1POH and resi 57 and name CA, 1POH and resi 67 and name CA  # target=27.330894137376415 current=30.248858946661066
color yellow, pair_05
distance pair_06, 1POH and resi 55 and name CA, 1POH and resi 67 and name CA  # target=27.3162312004818 current=30.209255955517445
color yellow, pair_06
distance pair_07, 1POH and resi 10 and name CA, 1POH and resi 29 and name CA  # target=27.295776683661106 current=29.945421263833616
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
