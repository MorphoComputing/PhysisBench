# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.5931506007067768

load 1UBQ.pdb, 1UBQ
bg_color white
hide everything, 1UBQ
show cartoon, 1UBQ
color grey80, 1UBQ
set cartoon_transparency, 0.1

select worst_residues, 1UBQ and resi 9+10+30+37+53+56+63+71+73+74
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1UBQ and resi 16+26+74+244+319+514
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1UBQ and resi 1 and name CA, 1UBQ and resi 41 and name CA  # target=10.276701803962172 current=19.88760109160218
color yellow, pair_00
distance pair_01, 1UBQ and resi 11 and name CA, 1UBQ and resi 54 and name CA  # target=12.400525038128055 current=20.787322598290608
color yellow, pair_01
distance pair_02, 1UBQ and resi 7 and name CA, 1UBQ and resi 26 and name CA  # target=9.484374229307953 current=17.593175519662495
color yellow, pair_02
distance pair_03, 1UBQ and resi 36 and name CA, 1UBQ and resi 66 and name CA  # target=9.018938536218213 current=16.995701240192567
color yellow, pair_03
distance pair_04, 1UBQ and resi 9 and name CA, 1UBQ and resi 26 and name CA  # target=12.026312030042083 current=19.780653268506732
color yellow, pair_04
distance pair_05, 1UBQ and resi 50 and name CA, 1UBQ and resi 74 and name CA  # target=25.084604260212924 current=17.48797479720303
color yellow, pair_05
distance pair_06, 1UBQ and resi 41 and name CA, 1UBQ and resi 73 and name CA  # target=18.03445860996761 current=10.529480809918649
color yellow, pair_06
distance pair_07, 1UBQ and resi 10 and name CA, 1UBQ and resi 41 and name CA  # target=8.590012346823865 current=16.069129984196085
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
