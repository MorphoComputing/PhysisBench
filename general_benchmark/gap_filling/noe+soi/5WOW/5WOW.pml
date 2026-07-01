# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.436085408253716

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+2+3+4+12+14+24+30+33+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 5WOW and resi 23+35
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 5WOW and resi 1 and name CA, 5WOW and resi 37 and name CA  # target=19.47983412505637 current=13.219755912944356
color yellow, pair_00
distance pair_01, 5WOW and resi 8 and name CA, 5WOW and resi 28 and name CA  # target=3.807615173945761 current=8.828932765738404
color yellow, pair_01
distance pair_02, 5WOW and resi 3 and name CA, 5WOW and resi 30 and name CA  # target=3.807615173945761 current=8.385110082094588
color yellow, pair_02
distance pair_03, 5WOW and resi 9 and name CA, 5WOW and resi 27 and name CA  # target=4.1298718554000935 current=7.051293776411562
color yellow, pair_03
distance pair_04, 5WOW and resi 1 and name CA, 5WOW and resi 19 and name CA  # target=6.1211101882448276 current=3.6146691387912244
color yellow, pair_04
distance pair_05, 5WOW and resi 12 and name CA, 5WOW and resi 22 and name CA  # target=5.4040284177073215 current=6.819983066437066
color yellow, pair_05
distance pair_06, 5WOW and resi 21 and name CA, 5WOW and resi 29 and name CA  # target=5.790717228239924 current=4.588182157177302
color yellow, pair_06
distance pair_07, 5WOW and resi 2 and name CA, 5WOW and resi 19 and name CA  # target=6.1211101882448276 current=7.264875158606523
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
