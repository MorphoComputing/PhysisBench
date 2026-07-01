# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.923457193189212

load 2YXF.pdb, 2YXF
bg_color white
hide everything, 2YXF
show cartoon, 2YXF
color grey80, 2YXF
set cartoon_transparency, 0.1

select worst_residues, 2YXF and resi 14+15+16+17+18+51+53+54+59+97
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2YXF and resi 2+19+66+75+114+245
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2YXF and resi 1 and name CA, 2YXF and resi 19 and name CA  # target=27.499932746753043 current=41.44456623054664
color yellow, pair_00
distance pair_01, 2YXF and resi 1 and name CA, 2YXF and resi 18 and name CA  # target=27.4999710015257 current=41.3521809182715
color yellow, pair_01
distance pair_02, 2YXF and resi 1 and name CA, 2YXF and resi 75 and name CA  # target=27.499824030725062 current=40.49537910920943
color yellow, pair_02
distance pair_03, 2YXF and resi 59 and name CA, 2YXF and resi 75 and name CA  # target=27.49969534451664 current=39.99907165018639
color yellow, pair_03
distance pair_04, 2YXF and resi 1 and name CA, 2YXF and resi 17 and name CA  # target=27.499928295470287 current=39.78318526482013
color yellow, pair_04
distance pair_05, 2YXF and resi 58 and name CA, 2YXF and resi 75 and name CA  # target=27.499754189025133 current=39.64056677897973
color yellow, pair_05
distance pair_06, 2YXF and resi 1 and name CA, 2YXF and resi 74 and name CA  # target=27.499846853183367 current=39.620215645100096
color yellow, pair_06
distance pair_07, 2YXF and resi 1 and name CA, 2YXF and resi 73 and name CA  # target=27.499781229386073 current=39.43377093231586
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
