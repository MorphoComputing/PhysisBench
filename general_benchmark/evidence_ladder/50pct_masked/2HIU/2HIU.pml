# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.59052134997901

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 9+11+14+16+17+18+19+20+21+22
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 12+22
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 12 and name CA, 2HIU and resi 20 and name CA  # target=9.66827838459617 current=4.891417033883524
color yellow, pair_00
distance pair_01, 2HIU and resi 11 and name CA, 2HIU and resi 22 and name CA  # target=7.862625837854051 current=3.885988783753627
color yellow, pair_01
distance pair_02, 2HIU and resi 19 and name CA, 2HIU and resi 42 and name CA  # target=4.525672114932564 current=8.468666547498147
color yellow, pair_02
distance pair_03, 2HIU and resi 14 and name CA, 2HIU and resi 22 and name CA  # target=12.069753078557488 current=8.15565158136228
color yellow, pair_03
distance pair_04, 2HIU and resi 20 and name CA, 2HIU and resi 37 and name CA  # target=16.03733063688611 current=12.172271756474558
color yellow, pair_04
distance pair_05, 2HIU and resi 13 and name CA, 2HIU and resi 22 and name CA  # target=13.262851727252887 current=9.686113967271002
color yellow, pair_05
distance pair_06, 2HIU and resi 11 and name CA, 2HIU and resi 20 and name CA  # target=8.320422976495042 current=4.868318419250051
color yellow, pair_06
distance pair_07, 2HIU and resi 13 and name CA, 2HIU and resi 21 and name CA  # target=11.193929173959464 current=8.127902740677877
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
