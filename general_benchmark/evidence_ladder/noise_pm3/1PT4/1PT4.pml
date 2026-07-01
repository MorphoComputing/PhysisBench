# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.43730166193374

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 2+6+10+12+13+17+20+22+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1PT4 and resi 12+14+26+48
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1PT4 and resi 1 and name CA, 1PT4 and resi 13 and name CA  # target=18.318608968854793 current=10.702607246206172
color yellow, pair_00
distance pair_01, 1PT4 and resi 2 and name CA, 1PT4 and resi 23 and name CA  # target=14.262326767962874 current=7.532995083374066
color yellow, pair_01
distance pair_02, 1PT4 and resi 1 and name CA, 1PT4 and resi 10 and name CA  # target=16.77730111339526 current=10.308655062148162
color yellow, pair_02
distance pair_03, 1PT4 and resi 3 and name CA, 1PT4 and resi 27 and name CA  # target=14.348107876741667 current=8.07050675682653
color yellow, pair_03
distance pair_04, 1PT4 and resi 1 and name CA, 1PT4 and resi 26 and name CA  # target=15.827515238877146 current=9.695479285702186
color yellow, pair_04
distance pair_05, 1PT4 and resi 3 and name CA, 1PT4 and resi 24 and name CA  # target=17.76145507992323 current=11.93600089020652
color yellow, pair_05
distance pair_06, 1PT4 and resi 13 and name CA, 1PT4 and resi 26 and name CA  # target=6.655897023143685 current=12.452308391960308
color yellow, pair_06
distance pair_07, 1PT4 and resi 11 and name CA, 1PT4 and resi 24 and name CA  # target=16.926765227758963 current=12.094043732224502
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
