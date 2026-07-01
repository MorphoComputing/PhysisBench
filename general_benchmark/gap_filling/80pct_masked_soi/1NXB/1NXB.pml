# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2039440832850623

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 6+15+17+18+20+30+31+33+34+43
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NXB and resi 21 and name CA, 1NXB and resi 31 and name CA  # target=27.499997687010826 current=31.98338988995435
color yellow, pair_00
distance pair_01, 1NXB and resi 31 and name CA, 1NXB and resi 55 and name CA  # target=27.499937139270507 current=30.834368295579896
color yellow, pair_01
distance pair_02, 1NXB and resi 1 and name CA, 1NXB and resi 31 and name CA  # target=27.499875227700194 current=30.398367541027504
color yellow, pair_02
distance pair_03, 1NXB and resi 17 and name CA, 1NXB and resi 31 and name CA  # target=27.499995083214717 current=30.062099309862965
color yellow, pair_03
distance pair_04, 1NXB and resi 20 and name CA, 1NXB and resi 32 and name CA  # target=27.499933129659134 current=29.638945867877865
color yellow, pair_04
distance pair_05, 1NXB and resi 30 and name CA, 1NXB and resi 56 and name CA  # target=27.498170621428063 current=29.298146562702037
color yellow, pair_05
distance pair_06, 1NXB and resi 18 and name CA, 1NXB and resi 34 and name CA  # target=27.499877656159143 current=29.278583372442768
color yellow, pair_06
distance pair_07, 1NXB and resi 31 and name CA, 1NXB and resi 40 and name CA  # target=26.75737338704696 current=25.079194317450217
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
