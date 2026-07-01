# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.136968968008

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+2+3+7+8+11+13+24+25+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 15 and name CA, 1PT4 and resi 27 and name CA  # target=9.05218042776833 current=4.003580020826241
color yellow, pair_00
distance pair_01, 1PT4 and resi 2 and name CA, 1PT4 and resi 15 and name CA  # target=10.357944763220205 current=5.985328957673399
color yellow, pair_01
distance pair_02, 1PT4 and resi 1 and name CA, 1PT4 and resi 17 and name CA  # target=11.891693078872377 current=7.787371717297023
color yellow, pair_02
distance pair_03, 1PT4 and resi 2 and name CA, 1PT4 and resi 16 and name CA  # target=9.181426581005663 current=5.439700831771289
color yellow, pair_03
distance pair_04, 1PT4 and resi 1 and name CA, 1PT4 and resi 16 and name CA  # target=11.387677033528727 current=7.797476084830514
color yellow, pair_04
distance pair_05, 1PT4 and resi 2 and name CA, 1PT4 and resi 17 and name CA  # target=10.389648597788023 current=7.065074742444717
color yellow, pair_05
distance pair_06, 1PT4 and resi 3 and name CA, 1PT4 and resi 21 and name CA  # target=5.530001778943845 current=8.710595198159286
color yellow, pair_06
distance pair_07, 1PT4 and resi 15 and name CA, 1PT4 and resi 26 and name CA  # target=9.215401329208724 current=6.647876356838587
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
