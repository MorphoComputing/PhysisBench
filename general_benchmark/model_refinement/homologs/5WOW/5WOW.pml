# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.406473118282234

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+2+5+17+29+30+33+34+35+36
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 2 and name CA, 5WOW and resi 23 and name CA  # target=15.6616340790142 current=14.636219927883666
color yellow, pair_00
distance pair_01, 5WOW and resi 5 and name CA, 5WOW and resi 17 and name CA  # target=10.575070519917134 current=9.566454193571905
color yellow, pair_01
distance pair_02, 5WOW and resi 9 and name CA, 5WOW and resi 27 and name CA  # target=5.900543286479535 current=4.989403346043984
color yellow, pair_02
distance pair_03, 5WOW and resi 5 and name CA, 5WOW and resi 19 and name CA  # target=11.127185230179881 current=12.022380139517566
color yellow, pair_03
distance pair_04, 5WOW and resi 5 and name CA, 5WOW and resi 15 and name CA  # target=14.978967927699047 current=14.100838192752532
color yellow, pair_04
distance pair_05, 5WOW and resi 10 and name CA, 5WOW and resi 22 and name CA  # target=6.267021174020925 current=5.3979725451242055
color yellow, pair_05
distance pair_06, 5WOW and resi 2 and name CA, 5WOW and resi 24 and name CA  # target=19.256111965675785 current=18.398140765672125
color yellow, pair_06
distance pair_07, 5WOW and resi 5 and name CA, 5WOW and resi 20 and name CA  # target=9.392243814427452 current=10.248444916475496
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
