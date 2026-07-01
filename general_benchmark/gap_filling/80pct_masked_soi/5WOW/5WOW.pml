# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9641032419028358

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 3+7+17+18+19+25+29+32+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 3 and name CA, 5WOW and resi 31 and name CA  # target=4.557550567889108 current=6.181444724538574
color yellow, pair_00
distance pair_01, 5WOW and resi 3 and name CA, 5WOW and resi 30 and name CA  # target=5.922712468845746 current=7.319670837075787
color yellow, pair_01
distance pair_02, 5WOW and resi 1 and name CA, 5WOW and resi 37 and name CA  # target=9.39013674181252 current=8.01012050640455
color yellow, pair_02
distance pair_03, 5WOW and resi 16 and name CA, 5WOW and resi 34 and name CA  # target=16.69848144344859 current=18.077290826688934
color yellow, pair_03
distance pair_04, 5WOW and resi 3 and name CA, 5WOW and resi 27 and name CA  # target=11.085311476871562 current=12.339385091694375
color yellow, pair_04
distance pair_05, 5WOW and resi 25 and name CA, 5WOW and resi 36 and name CA  # target=15.455797838075036 current=16.593482639749702
color yellow, pair_05
distance pair_06, 5WOW and resi 8 and name CA, 5WOW and resi 29 and name CA  # target=8.438951983201408 current=7.397862187134378
color yellow, pair_06
distance pair_07, 5WOW and resi 18 and name CA, 5WOW and resi 30 and name CA  # target=12.482659710943787 current=13.43181725160267
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
