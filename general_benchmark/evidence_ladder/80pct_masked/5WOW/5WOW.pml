# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.860837274247381

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+6+9+12+14+19+21+27+33+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 5WOW and resi 4+6+12+28+33
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 5WOW and resi 8 and name CA, 5WOW and resi 19 and name CA  # target=12.919288739956485 current=7.154958011083219
color yellow, pair_00
distance pair_01, 5WOW and resi 6 and name CA, 5WOW and resi 33 and name CA  # target=8.295080734513878 current=13.798845595034868
color yellow, pair_01
distance pair_02, 5WOW and resi 26 and name CA, 5WOW and resi 37 and name CA  # target=16.011464678558813 current=11.04617792019086
color yellow, pair_02
distance pair_03, 5WOW and resi 17 and name CA, 5WOW and resi 25 and name CA  # target=17.149988720435918 current=12.21126299520052
color yellow, pair_03
distance pair_04, 5WOW and resi 11 and name CA, 5WOW and resi 19 and name CA  # target=15.16734947832507 current=10.237169142157365
color yellow, pair_04
distance pair_05, 5WOW and resi 21 and name CA, 5WOW and resi 35 and name CA  # target=17.80064444417942 current=13.018725006220874
color yellow, pair_05
distance pair_06, 5WOW and resi 22 and name CA, 5WOW and resi 33 and name CA  # target=17.019214596811477 current=12.485568094444112
color yellow, pair_06
distance pair_07, 5WOW and resi 14 and name CA, 5WOW and resi 31 and name CA  # target=16.20884646481912 current=11.762921750039846
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
