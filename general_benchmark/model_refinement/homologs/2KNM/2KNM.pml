# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.673167528251616

load 2KNM.pdb, 2KNM
bg_color white
hide everything, 2KNM
show cartoon, 2KNM
color grey80, 2KNM
set cartoon_transparency, 0.1

select worst_residues, 2KNM and resi 1+4+5+10+11+15+20+22+23+28
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2KNM and resi 12 and name CA, 2KNM and resi 26 and name CA  # target=6.971804926134306 current=6.050679222153291
color yellow, pair_00
distance pair_01, 2KNM and resi 7 and name CA, 2KNM and resi 24 and name CA  # target=5.506024557374232 current=4.586441527167395
color yellow, pair_01
distance pair_02, 2KNM and resi 2 and name CA, 2KNM and resi 27 and name CA  # target=4.8483159604097725 current=4.063608300875039
color yellow, pair_02
distance pair_03, 2KNM and resi 7 and name CA, 2KNM and resi 25 and name CA  # target=6.219108513967449 current=5.506493281734924
color yellow, pair_03
distance pair_04, 2KNM and resi 7 and name CA, 2KNM and resi 26 and name CA  # target=7.084625283550045 current=6.466386343211313
color yellow, pair_04
distance pair_05, 2KNM and resi 9 and name CA, 2KNM and resi 26 and name CA  # target=12.348382491104644 current=11.784188277881432
color yellow, pair_05
distance pair_06, 2KNM and resi 11 and name CA, 2KNM and resi 26 and name CA  # target=9.223163059254897 current=8.707862815002004
color yellow, pair_06
distance pair_07, 2KNM and resi 10 and name CA, 2KNM and resi 26 and name CA  # target=11.378314476858058 current=10.868243321550816
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
