# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.399786203707802

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 6+21+27+32+36+38+40+41+42+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CRN and resi 18 and name CA, 1CRN and resi 41 and name CA  # target=27.09683213626289 current=28.587673507769768
color yellow, pair_00
distance pair_01, 1CRN and resi 3 and name CA, 1CRN and resi 31 and name CA  # target=5.03752712519315 current=4.094892812598349
color yellow, pair_01
distance pair_02, 1CRN and resi 18 and name CA, 1CRN and resi 42 and name CA  # target=26.401200431552624 current=27.230547014066158
color yellow, pair_02
distance pair_03, 1CRN and resi 19 and name CA, 1CRN and resi 41 and name CA  # target=26.685412238411455 current=27.478104709182873
color yellow, pair_03
distance pair_04, 1CRN and resi 24 and name CA, 1CRN and resi 41 and name CA  # target=20.942522506803744 current=21.62570756928796
color yellow, pair_04
distance pair_05, 1CRN and resi 21 and name CA, 1CRN and resi 42 and name CA  # target=22.181567826498007 current=22.83469491264717
color yellow, pair_05
distance pair_06, 1CRN and resi 20 and name CA, 1CRN and resi 42 and name CA  # target=23.661665604284536 current=24.313597139397732
color yellow, pair_06
distance pair_07, 1CRN and resi 4 and name CA, 1CRN and resi 43 and name CA  # target=4.919483835917674 current=4.270655673326321
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
