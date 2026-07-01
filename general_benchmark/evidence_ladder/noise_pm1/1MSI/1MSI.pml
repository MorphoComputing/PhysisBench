# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4672622566831929

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 2+3+17+25+32+33+38+59+61+64
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1MSI and resi 5+21+35
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1MSI and resi 9 and name CA, 1MSI and resi 38 and name CA  # target=14.056826486881505 current=17.894888735920997
color yellow, pair_00
distance pair_01, 1MSI and resi 15 and name CA, 1MSI and resi 62 and name CA  # target=10.430977022169303 current=13.941569360566131
color yellow, pair_01
distance pair_02, 1MSI and resi 22 and name CA, 1MSI and resi 35 and name CA  # target=8.455859028460644 current=11.551181770225828
color yellow, pair_02
distance pair_03, 1MSI and resi 29 and name CA, 1MSI and resi 42 and name CA  # target=21.908364643405758 current=24.699435388094116
color yellow, pair_03
distance pair_04, 1MSI and resi 37 and name CA, 1MSI and resi 60 and name CA  # target=14.414261985152365 current=11.654291186476295
color yellow, pair_04
distance pair_05, 1MSI and resi 20 and name CA, 1MSI and resi 62 and name CA  # target=17.83283419688955 current=20.591565089972875
color yellow, pair_05
distance pair_06, 1MSI and resi 18 and name CA, 1MSI and resi 46 and name CA  # target=12.616116575816957 current=15.283093507204025
color yellow, pair_06
distance pair_07, 1MSI and resi 11 and name CA, 1MSI and resi 63 and name CA  # target=14.153283781465465 current=16.818620354503324
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
