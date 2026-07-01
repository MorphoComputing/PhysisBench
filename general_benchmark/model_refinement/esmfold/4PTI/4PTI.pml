# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.29314271904376576

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 15+16+17+25+26+27+28+33+46+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4PTI and resi 14 and name CA, 4PTI and resi 56 and name CA  # target=27.445102029756534 current=31.202705559005995
color yellow, pair_00
distance pair_01, 4PTI and resi 13 and name CA, 4PTI and resi 56 and name CA  # target=27.38806940959286 current=30.154171944266743
color yellow, pair_01
distance pair_02, 4PTI and resi 15 and name CA, 4PTI and resi 56 and name CA  # target=27.333536169260555 current=29.690217618003235
color yellow, pair_02
distance pair_03, 4PTI and resi 12 and name CA, 4PTI and resi 56 and name CA  # target=27.305512518714085 current=29.344130450298895
color yellow, pair_03
distance pair_04, 4PTI and resi 14 and name CA, 4PTI and resi 55 and name CA  # target=27.05776568542578 current=28.482193477357626
color yellow, pair_04
distance pair_05, 4PTI and resi 2 and name CA, 4PTI and resi 56 and name CA  # target=12.177057618566026 current=11.063462462308422
color yellow, pair_05
distance pair_06, 4PTI and resi 1 and name CA, 4PTI and resi 14 and name CA  # target=26.81394524240496 current=27.89990857480158
color yellow, pair_06
distance pair_07, 4PTI and resi 3 and name CA, 4PTI and resi 56 and name CA  # target=13.305288386183173 current=12.313609588942555
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
