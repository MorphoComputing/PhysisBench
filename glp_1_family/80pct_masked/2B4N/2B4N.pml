# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.424876555531089

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 1+2+3+4+5+16+28+35+36+40
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2B4N and resi 6+12+19+90
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2B4N and resi 5 and name CA, 2B4N and resi 31 and name CA  # target=42.487218502248815 current=26.929741169931372
color yellow, pair_00
distance pair_01, 2B4N and resi 5 and name CA, 2B4N and resi 30 and name CA  # target=42.45452000051663 current=28.07809148833784
color yellow, pair_01
distance pair_02, 2B4N and resi 4 and name CA, 2B4N and resi 33 and name CA  # target=47.28605217849462 current=34.82521237916395
color yellow, pair_02
distance pair_03, 2B4N and resi 4 and name CA, 2B4N and resi 32 and name CA  # target=46.86117891441325 current=34.516703012589055
color yellow, pair_03
distance pair_04, 2B4N and resi 1 and name CA, 2B4N and resi 35 and name CA  # target=52.212807686740746 current=40.08067506377346
color yellow, pair_04
distance pair_05, 2B4N and resi 2 and name CA, 2B4N and resi 23 and name CA  # target=27.374563408701942 current=15.309686035630643
color yellow, pair_05
distance pair_06, 2B4N and resi 4 and name CA, 2B4N and resi 24 and name CA  # target=32.09277118793868 current=20.381997068733725
color yellow, pair_06
distance pair_07, 2B4N and resi 6 and name CA, 2B4N and resi 34 and name CA  # target=47.472560153285606 current=36.42342040958556
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
