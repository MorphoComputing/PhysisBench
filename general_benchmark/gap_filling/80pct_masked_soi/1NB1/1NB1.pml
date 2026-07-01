# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.7974039161569225

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 6+7+8+14+17+19+20+22+25+27
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 1 and name CA, 1NB1 and resi 27 and name CA  # target=10.59493600347456 current=8.086848046403057
color yellow, pair_00
distance pair_01, 1NB1 and resi 1 and name CA, 1NB1 and resi 20 and name CA  # target=10.07950448552278 current=8.169042100605747
color yellow, pair_01
distance pair_02, 1NB1 and resi 2 and name CA, 1NB1 and resi 17 and name CA  # target=10.327601646091601 current=10.874408293368765
color yellow, pair_02
distance pair_03, 1NB1 and resi 11 and name CA, 1NB1 and resi 20 and name CA  # target=11.332462280653642 current=11.835292381680123
color yellow, pair_03
distance pair_04, 1NB1 and resi 8 and name CA, 1NB1 and resi 19 and name CA  # target=9.625823036384823 current=10.023426818940855
color yellow, pair_04
distance pair_05, 1NB1 and resi 1 and name CA, 1NB1 and resi 22 and name CA  # target=8.610373999035655 current=8.239117836558714
color yellow, pair_05
distance pair_06, 1NB1 and resi 3 and name CA, 1NB1 and resi 12 and name CA  # target=13.111782995340523 current=13.471325121336953
color yellow, pair_06
distance pair_07, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=5.185984811523819 current=5.520829900455086
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
