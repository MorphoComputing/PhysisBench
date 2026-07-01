# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4837392523455685

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 9+15+23+26+31+39+45+48+51+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 4PTI and resi 4+9+26
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 4PTI and resi 14 and name CA, 4PTI and resi 56 and name CA  # target=27.419830279662584 current=31.35309157851845
color yellow, pair_00
distance pair_01, 4PTI and resi 5 and name CA, 4PTI and resi 42 and name CA  # target=11.325194933199922 current=7.77206398941949
color yellow, pair_01
distance pair_02, 4PTI and resi 18 and name CA, 4PTI and resi 29 and name CA  # target=15.28970852890671 current=11.904711380758382
color yellow, pair_02
distance pair_03, 4PTI and resi 13 and name CA, 4PTI and resi 56 and name CA  # target=27.235549011776115 current=30.250867096860716
color yellow, pair_03
distance pair_04, 4PTI and resi 16 and name CA, 4PTI and resi 32 and name CA  # target=12.238221663160475 current=9.249701490648937
color yellow, pair_04
distance pair_05, 4PTI and resi 1 and name CA, 4PTI and resi 45 and name CA  # target=19.528278761969013 current=16.567739247059905
color yellow, pair_05
distance pair_06, 4PTI and resi 16 and name CA, 4PTI and resi 35 and name CA  # target=8.551210529128138 current=5.612850753249286
color yellow, pair_06
distance pair_07, 4PTI and resi 2 and name CA, 4PTI and resi 42 and name CA  # target=11.776757325203091 current=8.947586430136473
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
