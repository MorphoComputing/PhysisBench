# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.483397732765398

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 1+9+17+18+23+25+26+27+33+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1R1F and resi 11+13+19+35+41+189
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1R1F and resi 6 and name CA, 1R1F and resi 25 and name CA  # target=16.49387320514499 current=8.771354195523225
color yellow, pair_00
distance pair_01, 1R1F and resi 10 and name CA, 1R1F and resi 22 and name CA  # target=13.608322320223829 current=6.427979734554405
color yellow, pair_01
distance pair_02, 1R1F and resi 17 and name CA, 1R1F and resi 34 and name CA  # target=19.339820641179646 current=12.23978468004519
color yellow, pair_02
distance pair_03, 1R1F and resi 18 and name CA, 1R1F and resi 35 and name CA  # target=19.05342782256218 current=12.188223471376002
color yellow, pair_03
distance pair_04, 1R1F and resi 2 and name CA, 1R1F and resi 11 and name CA  # target=17.559395004586396 current=11.137969808961424
color yellow, pair_04
distance pair_05, 1R1F and resi 7 and name CA, 1R1F and resi 30 and name CA  # target=15.743056515407003 current=9.37949155463842
color yellow, pair_05
distance pair_06, 1R1F and resi 8 and name CA, 1R1F and resi 28 and name CA  # target=16.283416609855692 current=10.43259747678543
color yellow, pair_06
distance pair_07, 1R1F and resi 18 and name CA, 1R1F and resi 30 and name CA  # target=17.58020508926138 current=11.73610475398941
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
