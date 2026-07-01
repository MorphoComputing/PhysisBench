# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.5947829529196107

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 1+2+3+4+5+6+10+21+23+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1IB9 and resi 1 and name CA, 1IB9 and resi 28 and name CA  # target=21.182662526427034 current=17.54023764444188
color yellow, pair_00
distance pair_01, 1IB9 and resi 5 and name CA, 1IB9 and resi 27 and name CA  # target=17.21464483599735 current=13.864139846263427
color yellow, pair_01
distance pair_02, 1IB9 and resi 1 and name CA, 1IB9 and resi 27 and name CA  # target=18.372669825337674 current=15.031624311931136
color yellow, pair_02
distance pair_03, 1IB9 and resi 5 and name CA, 1IB9 and resi 28 and name CA  # target=20.659082420238555 current=17.47342720978376
color yellow, pair_03
distance pair_04, 1IB9 and resi 5 and name CA, 1IB9 and resi 22 and name CA  # target=5.819399985254058 current=8.976452151159146
color yellow, pair_04
distance pair_05, 1IB9 and resi 1 and name CA, 1IB9 and resi 25 and name CA  # target=12.563975895411433 current=9.710984566024724
color yellow, pair_05
distance pair_06, 1IB9 and resi 5 and name CA, 1IB9 and resi 25 and name CA  # target=11.881867383891686 current=9.088154306546791
color yellow, pair_06
distance pair_07, 1IB9 and resi 2 and name CA, 1IB9 and resi 22 and name CA  # target=7.038076499424324 current=9.762038352607842
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
