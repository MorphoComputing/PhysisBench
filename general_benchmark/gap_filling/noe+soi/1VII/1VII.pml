# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.5443477779067933

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 1+2+11+15+16+18+20+26+30+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 7+15+29
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 1 and name CA, 1VII and resi 34 and name CA  # target=20.34476741956041 current=9.158696409894988
color yellow, pair_00
distance pair_01, 1VII and resi 9 and name CA, 1VII and resi 34 and name CA  # target=17.613925990444965 current=10.29188811523783
color yellow, pair_01
distance pair_02, 1VII and resi 10 and name CA, 1VII and resi 29 and name CA  # target=4.893392851656878 current=10.331201532875085
color yellow, pair_02
distance pair_03, 1VII and resi 10 and name CA, 1VII and resi 28 and name CA  # target=5.533144452470395 current=8.853225582492003
color yellow, pair_03
distance pair_04, 1VII and resi 10 and name CA, 1VII and resi 33 and name CA  # target=5.790717228239924 current=8.643293392844708
color yellow, pair_04
distance pair_05, 1VII and resi 17 and name CA, 1VII and resi 25 and name CA  # target=4.647636918307805 current=6.989326321146947
color yellow, pair_05
distance pair_06, 1VII and resi 9 and name CA, 1VII and resi 32 and name CA  # target=5.212492862963047 current=7.473935200330299
color yellow, pair_06
distance pair_07, 1VII and resi 1 and name CA, 1VII and resi 9 and name CA  # target=5.770264702169771 current=3.657421864294653
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
