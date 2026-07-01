# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9355213340869196

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 4+5+6+7+9+10+11+22+23+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 19 and name CA, 2KNM and resi 28 and name CA  # target=5.093615941360621 current=4.22530843686535
color yellow, pair_00
distance pair_01, 2KNM and resi 6 and name CA, 2KNM and resi 25 and name CA  # target=5.083757090409309 current=4.440920788903699
color yellow, pair_01
distance pair_02, 2KNM and resi 2 and name CA, 2KNM and resi 27 and name CA  # target=5.133411723857945 current=4.493521339340901
color yellow, pair_02
distance pair_03, 2KNM and resi 7 and name CA, 2KNM and resi 24 and name CA  # target=5.530840624545385 current=5.063110255814827
color yellow, pair_03
distance pair_04, 2KNM and resi 19 and name CA, 2KNM and resi 27 and name CA  # target=5.6941128163109935 current=5.230556592637272
color yellow, pair_04
distance pair_05, 2KNM and resi 7 and name CA, 2KNM and resi 25 and name CA  # target=5.860401384245057 current=5.481343553989166
color yellow, pair_05
distance pair_06, 2KNM and resi 5 and name CA, 2KNM and resi 26 and name CA  # target=5.694945009971158 current=5.325823383175201
color yellow, pair_06
distance pair_07, 2KNM and resi 1 and name CA, 2KNM and resi 27 and name CA  # target=5.744463278483218 current=5.382371747180996
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
