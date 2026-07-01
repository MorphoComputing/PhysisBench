# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 8.095287348265156

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 1+3+8+12+27+56+60+88+99+102
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HRC and resi 17+58+101+293+577+1423
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HRC and resi 15 and name CA, 1HRC and resi 98 and name CA  # target=24.964259141031434 current=3.1596499651500305
color yellow, pair_00
distance pair_01, 1HRC and resi 16 and name CA, 1HRC and resi 97 and name CA  # target=25.3740618676041 current=4.39331029929072
color yellow, pair_01
distance pair_02, 1HRC and resi 16 and name CA, 1HRC and resi 98 and name CA  # target=25.06647307469719 current=4.377080434690699
color yellow, pair_02
distance pair_03, 1HRC and resi 49 and name CA, 1HRC and resi 57 and name CA  # target=27.31859284290082 current=8.67346858472016
color yellow, pair_03
distance pair_04, 1HRC and resi 46 and name CA, 1HRC and resi 57 and name CA  # target=26.597408625465924 current=8.044275065330252
color yellow, pair_04
distance pair_05, 1HRC and resi 14 and name CA, 1HRC and resi 98 and name CA  # target=23.93363261330732 current=6.24807063957608
color yellow, pair_05
distance pair_06, 1HRC and resi 47 and name CA, 1HRC and resi 57 and name CA  # target=27.241964980900985 current=9.704497079782596
color yellow, pair_06
distance pair_07, 1HRC and resi 15 and name CA, 1HRC and resi 94 and name CA  # target=26.69847400157586 current=9.547605104846527
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
