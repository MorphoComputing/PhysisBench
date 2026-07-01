# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.2714461553155463

load 1L2Y.pdb, 1L2Y
bg_color white
hide everything, 1L2Y
show cartoon, 1L2Y
color grey80, 1L2Y
set cartoon_transparency, 0.1

select worst_residues, 1L2Y and resi 1+6+7+9+10+11+14+16+17+18
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1L2Y and resi 1 and name CA, 1L2Y and resi 18 and name CA  # target=5.770264702169771 current=8.21120008845461
color yellow, pair_00
distance pair_01, 1L2Y and resi 2 and name CA, 1L2Y and resi 17 and name CA  # target=5.429350198084871 current=7.7217552445175945
color yellow, pair_01
distance pair_02, 1L2Y and resi 5 and name CA, 1L2Y and resi 16 and name CA  # target=4.893392851656878 current=7.10814545990235
color yellow, pair_02
distance pair_03, 1L2Y and resi 5 and name CA, 1L2Y and resi 15 and name CA  # target=5.353974409403234 current=7.5070852302244555
color yellow, pair_03
distance pair_04, 1L2Y and resi 5 and name CA, 1L2Y and resi 17 and name CA  # target=4.893392851656878 current=6.09807332821986
color yellow, pair_04
distance pair_05, 1L2Y and resi 2 and name CA, 1L2Y and resi 18 and name CA  # target=4.893392851656878 current=6.095510541381332
color yellow, pair_05
distance pair_06, 1L2Y and resi 5 and name CA, 1L2Y and resi 18 and name CA  # target=6.114476574701069 current=6.636527473019552
color yellow, pair_06

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
