# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.820773043841373

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 3+6+7+8+10+12+13+22+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1PT4 and resi 3+9+15+23
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1PT4 and resi 3 and name CA, 1PT4 and resi 22 and name CA  # target=3.9693779294802645 current=9.366159253571945
color yellow, pair_00
distance pair_01, 1PT4 and resi 7 and name CA, 1PT4 and resi 18 and name CA  # target=4.647636918307805 current=7.262280859920535
color yellow, pair_01
distance pair_02, 1PT4 and resi 14 and name CA, 1PT4 and resi 22 and name CA  # target=4.893392851656878 current=6.9235054946269
color yellow, pair_02
distance pair_03, 1PT4 and resi 5 and name CA, 1PT4 and resi 18 and name CA  # target=4.647636918307805 current=6.4250141685845765
color yellow, pair_03
distance pair_04, 1PT4 and resi 5 and name CA, 1PT4 and resi 20 and name CA  # target=6.114476574701069 current=7.766400034292182
color yellow, pair_04
distance pair_05, 1PT4 and resi 4 and name CA, 1PT4 and resi 21 and name CA  # target=4.893392851656878 current=6.302726422584916
color yellow, pair_05
distance pair_06, 1PT4 and resi 15 and name CA, 1PT4 and resi 24 and name CA  # target=5.790717228239924 current=7.178684267504272
color yellow, pair_06
distance pair_07, 1PT4 and resi 2 and name CA, 1PT4 and resi 10 and name CA  # target=5.533144452470395 current=6.889422823671482
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
