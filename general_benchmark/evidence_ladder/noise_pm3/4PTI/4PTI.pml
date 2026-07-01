# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6464825238457685

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 2+15+26+27+31+39+45+46+51+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4PTI and resi 10+35+45+141+252+402
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4PTI and resi 5 and name CA, 4PTI and resi 42 and name CA  # target=17.773916025678627 current=7.732395667414285
color yellow, pair_00
distance pair_01, 4PTI and resi 16 and name CA, 4PTI and resi 35 and name CA  # target=14.111143742346762 current=4.639388776246251
color yellow, pair_01
distance pair_02, 4PTI and resi 18 and name CA, 4PTI and resi 29 and name CA  # target=19.828563192266106 current=10.75739155742246
color yellow, pair_02
distance pair_03, 4PTI and resi 2 and name CA, 4PTI and resi 42 and name CA  # target=16.01711145014907 current=7.4780866632473355
color yellow, pair_03
distance pair_04, 4PTI and resi 16 and name CA, 4PTI and resi 32 and name CA  # target=17.253330258504757 current=9.261828768419859
color yellow, pair_04
distance pair_05, 4PTI and resi 25 and name CA, 4PTI and resi 40 and name CA  # target=10.086011179040304 current=17.862120295849298
color yellow, pair_05
distance pair_06, 4PTI and resi 1 and name CA, 4PTI and resi 45 and name CA  # target=22.725588625699757 current=15.311574884395748
color yellow, pair_06
distance pair_07, 4PTI and resi 18 and name CA, 4PTI and resi 35 and name CA  # target=15.321353562975057 current=8.303626465638581
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
