# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.3915331742409662

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 4+7+8+14+15+16+21+30+32+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1VII and resi 39
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1VII and resi 6 and name CA, 1VII and resi 17 and name CA  # target=4.893392851656878 current=9.710367765579642
color yellow, pair_00
distance pair_01, 1VII and resi 17 and name CA, 1VII and resi 28 and name CA  # target=4.893392851656878 current=9.407335952908372
color yellow, pair_01
distance pair_02, 1VII and resi 10 and name CA, 1VII and resi 29 and name CA  # target=4.893392851656878 current=8.463304677108924
color yellow, pair_02
distance pair_03, 1VII and resi 1 and name CA, 1VII and resi 33 and name CA  # target=12.803898162839694 current=9.608250981183646
color yellow, pair_03
distance pair_04, 1VII and resi 5 and name CA, 1VII and resi 33 and name CA  # target=14.143242875894178 current=11.280189282845079
color yellow, pair_04
distance pair_05, 1VII and resi 2 and name CA, 1VII and resi 33 and name CA  # target=16.48249303426945 current=13.656765765362955
color yellow, pair_05
distance pair_06, 1VII and resi 6 and name CA, 1VII and resi 33 and name CA  # target=12.855958484270877 current=10.04790023065802
color yellow, pair_06
distance pair_07, 1VII and resi 4 and name CA, 1VII and resi 33 and name CA  # target=17.532524576205105 current=15.01025455099313
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
