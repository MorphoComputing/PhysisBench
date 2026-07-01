# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3548577742874563

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 10+28+29+37+38+58+63+66+70+71
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1POH and resi 10 and name CA, 1POH and resi 67 and name CA  # target=27.499998509983207 current=33.278357302195325
color yellow, pair_00
distance pair_01, 1POH and resi 10 and name CA, 1POH and resi 66 and name CA  # target=27.499977098088348 current=31.792156808279305
color yellow, pair_01
distance pair_02, 1POH and resi 14 and name CA, 1POH and resi 67 and name CA  # target=27.495982281241975 current=29.223135203011303
color yellow, pair_02
distance pair_03, 1POH and resi 46 and name CA, 1POH and resi 58 and name CA  # target=17.63595398976002 current=19.039044651175498
color yellow, pair_03
distance pair_04, 1POH and resi 9 and name CA, 1POH and resi 66 and name CA  # target=27.49209849521963 current=28.680594838474637
color yellow, pair_04
distance pair_05, 1POH and resi 45 and name CA, 1POH and resi 63 and name CA  # target=14.676754667664566 current=15.389015104293208
color yellow, pair_05
distance pair_06, 1POH and resi 28 and name CA, 1POH and resi 37 and name CA  # target=23.822731592127205 current=24.479977977970034
color yellow, pair_06
distance pair_07, 1POH and resi 11 and name CA, 1POH and resi 72 and name CA  # target=23.643765871051393 current=24.291568169360506
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
