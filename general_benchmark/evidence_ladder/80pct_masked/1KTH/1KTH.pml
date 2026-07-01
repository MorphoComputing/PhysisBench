# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.383565060063047

load 1KTH.pdb, 1KTH
bg_color white
hide everything, 1KTH
show cartoon, 1KTH
color grey80, 1KTH
set cartoon_transparency, 0.1

select worst_residues, 1KTH and resi 16+18+26+34+37+38+39+40+41+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1KTH and resi 3+5+23
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1KTH and resi 26 and name CA, 1KTH and resi 41 and name CA  # target=18.578645492490576 current=11.90241004355144
color yellow, pair_00
distance pair_01, 1KTH and resi 27 and name CA, 1KTH and resi 40 and name CA  # target=18.410630721986717 current=12.400952750289964
color yellow, pair_01
distance pair_02, 1KTH and resi 28 and name CA, 1KTH and resi 38 and name CA  # target=22.722990680790943 current=16.844118882740027
color yellow, pair_02
distance pair_03, 1KTH and resi 18 and name CA, 1KTH and resi 33 and name CA  # target=4.733695894561645 current=9.101229751190928
color yellow, pair_03
distance pair_04, 1KTH and resi 22 and name CA, 1KTH and resi 30 and name CA  # target=6.414596609537698 current=10.295890525939475
color yellow, pair_04
distance pair_05, 1KTH and resi 5 and name CA, 1KTH and resi 56 and name CA  # target=12.24186628078139 current=15.992586557947813
color yellow, pair_05
distance pair_06, 1KTH and resi 22 and name CA, 1KTH and resi 41 and name CA  # target=10.3618611468036 current=6.8718365424145125
color yellow, pair_06
distance pair_07, 1KTH and resi 29 and name CA, 1KTH and resi 39 and name CA  # target=16.48794485516655 current=13.113107081613709
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
