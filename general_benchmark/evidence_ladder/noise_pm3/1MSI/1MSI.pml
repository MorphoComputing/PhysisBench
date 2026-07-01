# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.9479007930124612

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 2+34+36+38+44+55+59+61+63+64
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1MSI and resi 22+41+64+108+357+840
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1MSI and resi 9 and name CA, 1MSI and resi 38 and name CA  # target=8.596202586470865 current=19.768790604375642
color yellow, pair_00
distance pair_01, 1MSI and resi 39 and name CA, 1MSI and resi 56 and name CA  # target=19.17771963613467 current=9.561833333272759
color yellow, pair_01
distance pair_02, 1MSI and resi 39 and name CA, 1MSI and resi 59 and name CA  # target=18.347489231064305 current=9.036635685134256
color yellow, pair_02
distance pair_03, 1MSI and resi 37 and name CA, 1MSI and resi 60 and name CA  # target=18.98538163980764 current=9.737932742700435
color yellow, pair_03
distance pair_04, 1MSI and resi 38 and name CA, 1MSI and resi 64 and name CA  # target=14.836000264259628 current=6.131350499077473
color yellow, pair_04
distance pair_05, 1MSI and resi 42 and name CA, 1MSI and resi 62 and name CA  # target=16.0679700262578 current=7.507198934883968
color yellow, pair_05
distance pair_06, 1MSI and resi 8 and name CA, 1MSI and resi 61 and name CA  # target=12.697958862988518 current=20.826841523978384
color yellow, pair_06
distance pair_07, 1MSI and resi 42 and name CA, 1MSI and resi 59 and name CA  # target=17.731532146725513 current=10.066653904835078
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
