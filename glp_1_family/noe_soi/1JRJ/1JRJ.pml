# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.782749975717214

load 1JRJ.pdb, 1JRJ
bg_color white
hide everything, 1JRJ
show cartoon, 1JRJ
color grey80, 1JRJ
set cartoon_transparency, 0.1

select worst_residues, 1JRJ and resi 1+10+16+19+20+26+27+28+30+36
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1JRJ and resi 21+238
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1JRJ and resi 1 and name CA, 1JRJ and resi 37 and name CA  # target=17.04606997619684 current=34.058587242740614
color yellow, pair_00
distance pair_01, 1JRJ and resi 24 and name CA, 1JRJ and resi 34 and name CA  # target=6.128972277676497 current=9.670628495150225
color yellow, pair_01
distance pair_02, 1JRJ and resi 24 and name CA, 1JRJ and resi 35 and name CA  # target=6.128972277676497 current=9.092575973144516
color yellow, pair_02
distance pair_03, 1JRJ and resi 24 and name CA, 1JRJ and resi 36 and name CA  # target=5.772031158468575 current=7.3222705964212045
color yellow, pair_03
distance pair_04, 1JRJ and resi 21 and name CA, 1JRJ and resi 36 and name CA  # target=7.2145919427095455 current=7.508098786634999
color yellow, pair_04
distance pair_05, 1JRJ and resi 21 and name CA, 1JRJ and resi 37 and name CA  # target=5.772031158468575 current=5.488879646646376
color yellow, pair_05
distance pair_06, 1JRJ and resi 24 and name CA, 1JRJ and resi 37 and name CA  # target=7.2145919427095455 current=7.409928876980272
color yellow, pair_06

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
