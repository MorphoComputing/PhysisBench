# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4771433711765831

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 1+9+10+22+38+42+45+51+53+54
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2CI2 and resi 34+63+156+1043
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2CI2 and resi 2 and name CA, 2CI2 and resi 47 and name CA  # target=20.48931422287671 current=10.207049718595592
color yellow, pair_00
distance pair_01, 2CI2 and resi 49 and name CA, 2CI2 and resi 61 and name CA  # target=13.453486806783783 current=5.151298546670447
color yellow, pair_01
distance pair_02, 2CI2 and resi 13 and name CA, 2CI2 and resi 53 and name CA  # target=17.67912214758475 current=9.4903108634247
color yellow, pair_02
distance pair_03, 2CI2 and resi 18 and name CA, 2CI2 and resi 43 and name CA  # target=11.301812143293377 current=18.991674658270778
color yellow, pair_03
distance pair_04, 2CI2 and resi 14 and name CA, 2CI2 and resi 24 and name CA  # target=7.873648399894928 current=15.509609972346963
color yellow, pair_04
distance pair_05, 2CI2 and resi 6 and name CA, 2CI2 and resi 59 and name CA  # target=15.895936974159955 current=8.295754370188902
color yellow, pair_05
distance pair_06, 2CI2 and resi 2 and name CA, 2CI2 and resi 45 and name CA  # target=15.858891249424268 current=8.391195988998291
color yellow, pair_06
distance pair_07, 2CI2 and resi 7 and name CA, 2CI2 and resi 17 and name CA  # target=20.049692338062023 current=12.692873327109075
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
