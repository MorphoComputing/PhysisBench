# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.04074065182953195

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 11+12+13+14+15+16+33+35+37+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4PTI and resi 14 and name CA, 4PTI and resi 56 and name CA  # target=27.4998941696103 current=31.395747691177796
color yellow, pair_00
distance pair_01, 4PTI and resi 13 and name CA, 4PTI and resi 56 and name CA  # target=27.499360384307852 current=30.391916458965284
color yellow, pair_01
distance pair_02, 4PTI and resi 15 and name CA, 4PTI and resi 56 and name CA  # target=27.499304521823557 current=30.314241597286966
color yellow, pair_02
distance pair_03, 4PTI and resi 12 and name CA, 4PTI and resi 56 and name CA  # target=27.497074993689814 current=29.5043007791367
color yellow, pair_03
distance pair_04, 4PTI and resi 14 and name CA, 4PTI and resi 55 and name CA  # target=27.485966461083155 current=28.644482482151517
color yellow, pair_04
distance pair_05, 4PTI and resi 16 and name CA, 4PTI and resi 56 and name CA  # target=27.47893429799638 current=28.400995736526525
color yellow, pair_05
distance pair_06, 4PTI and resi 35 and name CA, 4PTI and resi 55 and name CA  # target=23.613117482721005 current=24.208088534780764
color yellow, pair_06
distance pair_07, 4PTI and resi 36 and name CA, 4PTI and resi 55 and name CA  # target=23.550399941605633 current=24.138878254429557
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
