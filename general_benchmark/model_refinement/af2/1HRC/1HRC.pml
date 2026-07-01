# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.3402407328448716

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 4+15+37+38+46+49+53+56+74+80
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HRC and resi 3 and name CA, 1HRC and resi 49 and name CA  # target=27.479641720437588 current=33.07616883293211
color yellow, pair_00
distance pair_01, 1HRC and resi 1 and name CA, 1HRC and resi 49 and name CA  # target=27.4741326089055 current=32.87364819653842
color yellow, pair_01
distance pair_02, 1HRC and resi 3 and name CA, 1HRC and resi 53 and name CA  # target=27.463835570191602 current=32.33156100492478
color yellow, pair_02
distance pair_03, 1HRC and resi 44 and name CA, 1HRC and resi 86 and name CA  # target=27.453555975791428 current=32.14209884765089
color yellow, pair_03
distance pair_04, 1HRC and resi 44 and name CA, 1HRC and resi 88 and name CA  # target=27.45202819144257 current=32.03987510090429
color yellow, pair_04
distance pair_05, 1HRC and resi 4 and name CA, 1HRC and resi 49 and name CA  # target=27.458839714748486 current=32.033797384990876
color yellow, pair_05
distance pair_06, 1HRC and resi 3 and name CA, 1HRC and resi 50 and name CA  # target=27.435222500380434 current=31.587100736869324
color yellow, pair_06
distance pair_07, 1HRC and resi 44 and name CA, 1HRC and resi 87 and name CA  # target=27.430501183651852 current=31.57263229930795
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
