# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 10.614437743856799

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 11+13+14+15+16+23+53+54+86+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1TIT and resi 20 and name CA, 1TIT and resi 57 and name CA  # target=5.790717228239924 current=9.6641240572287
color yellow, pair_00
distance pair_01, 1TIT and resi 20 and name CA, 1TIT and resi 59 and name CA  # target=5.533144452470395 current=9.345817647242546
color yellow, pair_01
distance pair_02, 1TIT and resi 35 and name CA, 1TIT and resi 64 and name CA  # target=5.1756846552692375 current=6.985661225296449
color yellow, pair_02
distance pair_03, 1TIT and resi 70 and name CA, 1TIT and resi 83 and name CA  # target=5.071063307555523 current=3.453721836859374
color yellow, pair_03
distance pair_04, 1TIT and resi 7 and name CA, 1TIT and resi 20 and name CA  # target=5.391441194277165 current=4.110406655787398
color yellow, pair_04
distance pair_05, 1TIT and resi 20 and name CA, 1TIT and resi 83 and name CA  # target=5.533144452470395 current=6.142464031395094
color yellow, pair_05
distance pair_06, 1TIT and resi 35 and name CA, 1TIT and resi 70 and name CA  # target=5.071063307555523 current=5.634663072509539
color yellow, pair_06
distance pair_07, 1TIT and resi 10 and name CA, 1TIT and resi 20 and name CA  # target=5.391441194277165 current=5.0731035423764785
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
