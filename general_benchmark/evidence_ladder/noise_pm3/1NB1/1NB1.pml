# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.170067335864715

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+10+11+12+13+18+19+25+26+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NB1 and resi 5+9+26+47
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NB1 and resi 11 and name CA, 1NB1 and resi 24 and name CA  # target=18.038984112731917 current=10.381117878980946
color yellow, pair_00
distance pair_01, 1NB1 and resi 2 and name CA, 1NB1 and resi 26 and name CA  # target=17.527277014707092 current=10.925149448122951
color yellow, pair_01
distance pair_02, 1NB1 and resi 4 and name CA, 1NB1 and resi 21 and name CA  # target=12.243957348907207 current=6.12297466623535
color yellow, pair_02
distance pair_03, 1NB1 and resi 3 and name CA, 1NB1 and resi 12 and name CA  # target=10.143923883027362 current=15.41304978198067
color yellow, pair_03
distance pair_04, 1NB1 and resi 10 and name CA, 1NB1 and resi 21 and name CA  # target=12.023432063015433 current=6.884861374139795
color yellow, pair_04
distance pair_05, 1NB1 and resi 2 and name CA, 1NB1 and resi 10 and name CA  # target=12.767520750547726 current=7.834240548523705
color yellow, pair_05
distance pair_06, 1NB1 and resi 4 and name CA, 1NB1 and resi 14 and name CA  # target=16.02577622734464 current=11.280687359799915
color yellow, pair_06
distance pair_07, 1NB1 and resi 7 and name CA, 1NB1 and resi 27 and name CA  # target=11.726796120217543 current=16.418930806116315
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
