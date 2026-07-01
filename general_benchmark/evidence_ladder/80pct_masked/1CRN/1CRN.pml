# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.4199584444168507

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 6+10+17+22+23+30+35+41+42+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CRN and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CRN and resi 1 and name CA, 1CRN and resi 44 and name CA  # target=10.062473178327187 current=3.6433405799028997
color yellow, pair_00
distance pair_01, 1CRN and resi 31 and name CA, 1CRN and resi 44 and name CA  # target=10.05304832469259 current=4.6268527036497495
color yellow, pair_01
distance pair_02, 1CRN and resi 14 and name CA, 1CRN and resi 23 and name CA  # target=14.008323488109003 current=9.033370390745626
color yellow, pair_02
distance pair_03, 1CRN and resi 23 and name CA, 1CRN and resi 41 and name CA  # target=20.457478044580537 current=16.89002659894888
color yellow, pair_03
distance pair_04, 1CRN and resi 5 and name CA, 1CRN and resi 35 and name CA  # target=19.751656105635128 current=16.194199592211906
color yellow, pair_04
distance pair_05, 1CRN and resi 35 and name CA, 1CRN and resi 44 and name CA  # target=15.680992590964978 current=12.13818979359968
color yellow, pair_05
distance pair_06, 1CRN and resi 18 and name CA, 1CRN and resi 42 and name CA  # target=27.404588610532215 current=23.978889324020397
color yellow, pair_06
distance pair_07, 1CRN and resi 8 and name CA, 1CRN and resi 31 and name CA  # target=6.612409411594652 current=3.197071940152835
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
