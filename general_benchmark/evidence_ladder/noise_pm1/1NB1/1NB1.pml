# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.6765712953498263

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+3+5+6+7+10+12+15+19+22
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 2 and name CA, 1NB1 and resi 10 and name CA  # target=9.541302230134898 current=6.841318682235256
color yellow, pair_00
distance pair_01, 1NB1 and resi 11 and name CA, 1NB1 and resi 24 and name CA  # target=14.150777388120305 current=11.56905020962959
color yellow, pair_01
distance pair_02, 1NB1 and resi 2 and name CA, 1NB1 and resi 26 and name CA  # target=13.899978839488911 current=11.557287166040894
color yellow, pair_02
distance pair_03, 1NB1 and resi 10 and name CA, 1NB1 and resi 21 and name CA  # target=9.884749719336428 current=7.739220484081794
color yellow, pair_03
distance pair_04, 1NB1 and resi 12 and name CA, 1NB1 and resi 24 and name CA  # target=8.997482135575762 current=11.100458790697193
color yellow, pair_04
distance pair_05, 1NB1 and resi 4 and name CA, 1NB1 and resi 14 and name CA  # target=11.835467090281842 current=9.965018883518079
color yellow, pair_05
distance pair_06, 1NB1 and resi 4 and name CA, 1NB1 and resi 21 and name CA  # target=7.783028644698047 current=6.021368403304642
color yellow, pair_06
distance pair_07, 1NB1 and resi 5 and name CA, 1NB1 and resi 16 and name CA  # target=9.446263022380414 current=7.732596914492664
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
