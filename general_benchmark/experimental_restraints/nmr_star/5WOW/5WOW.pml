# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.256352226436993

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+9+10+11+12+17+18+19+32+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 14 and name CA, 5WOW and resi 22 and name CA  # target=4.346675847658586 current=8.076495362531903
color yellow, pair_00
distance pair_01, 5WOW and resi 4 and name CA, 5WOW and resi 31 and name CA  # target=3.2686005254474764 current=6.0813319545116755
color yellow, pair_01
distance pair_02, 5WOW and resi 2 and name CA, 5WOW and resi 20 and name CA  # target=5.7972598823618355 current=7.838838842340261
color yellow, pair_02
distance pair_03, 5WOW and resi 22 and name CA, 5WOW and resi 30 and name CA  # target=5.212492862963047 current=3.2504918230931734
color yellow, pair_03
distance pair_04, 5WOW and resi 14 and name CA, 5WOW and resi 23 and name CA  # target=4.140074046378043 current=5.831150722586635
color yellow, pair_04
distance pair_05, 5WOW and resi 3 and name CA, 5WOW and resi 20 and name CA  # target=5.7972598823618355 current=7.035337214817961
color yellow, pair_05
distance pair_06, 5WOW and resi 11 and name CA, 5WOW and resi 28 and name CA  # target=4.186866660519927 current=5.346394483010272
color yellow, pair_06
distance pair_07, 5WOW and resi 8 and name CA, 5WOW and resi 33 and name CA  # target=7.001509147997216 current=8.066032485011798
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
