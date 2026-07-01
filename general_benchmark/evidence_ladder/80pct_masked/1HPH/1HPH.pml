# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.259924823325142

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+5+6+7+8+9+13+31+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HPH and resi 3+13
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HPH and resi 13 and name CA, 1HPH and resi 30 and name CA  # target=20.420896330418326 current=16.88592721846468
color yellow, pair_00
distance pair_01, 1HPH and resi 6 and name CA, 1HPH and resi 17 and name CA  # target=19.61438040994305 current=16.204282876543385
color yellow, pair_01
distance pair_02, 1HPH and resi 7 and name CA, 1HPH and resi 21 and name CA  # target=20.134816628043083 current=17.567329571646187
color yellow, pair_02
distance pair_03, 1HPH and resi 2 and name CA, 1HPH and resi 13 and name CA  # target=14.037397624687664 current=11.579048405447596
color yellow, pair_03
distance pair_04, 1HPH and resi 4 and name CA, 1HPH and resi 16 and name CA  # target=18.89825651744187 current=16.633628888672213
color yellow, pair_04
distance pair_05, 1HPH and resi 6 and name CA, 1HPH and resi 21 and name CA  # target=20.183171550283724 current=18.492962564249126
color yellow, pair_05
distance pair_06, 1HPH and resi 1 and name CA, 1HPH and resi 20 and name CA  # target=25.916788566355237 current=24.4097394783161
color yellow, pair_06
distance pair_07, 1HPH and resi 2 and name CA, 1HPH and resi 33 and name CA  # target=27.489702366267966 current=26.063661318140962
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
