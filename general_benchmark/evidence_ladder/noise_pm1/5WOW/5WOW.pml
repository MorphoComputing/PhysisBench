# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5536036702597567

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 2+3+4+12+14+15+32+33+36+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 5WOW and resi 6+33
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 5WOW and resi 10 and name CA, 5WOW and resi 30 and name CA  # target=13.375098824895998 current=10.76815839319093
color yellow, pair_00
distance pair_01, 5WOW and resi 7 and name CA, 5WOW and resi 34 and name CA  # target=11.476130394088242 current=8.882039167101668
color yellow, pair_01
distance pair_02, 5WOW and resi 11 and name CA, 5WOW and resi 28 and name CA  # target=11.04713892853881 current=8.683571832023683
color yellow, pair_02
distance pair_03, 5WOW and resi 25 and name CA, 5WOW and resi 35 and name CA  # target=14.491983376607015 current=16.819278092318918
color yellow, pair_03
distance pair_04, 5WOW and resi 4 and name CA, 5WOW and resi 35 and name CA  # target=13.457126453276045 current=11.22590840479159
color yellow, pair_04
distance pair_05, 5WOW and resi 14 and name CA, 5WOW and resi 29 and name CA  # target=13.871825236559635 current=11.642074979387553
color yellow, pair_05
distance pair_06, 5WOW and resi 17 and name CA, 5WOW and resi 25 and name CA  # target=14.506546918235552 current=16.725891005589734
color yellow, pair_06
distance pair_07, 5WOW and resi 17 and name CA, 5WOW and resi 30 and name CA  # target=10.661073215056923 current=12.801731266306602
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
